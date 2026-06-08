import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_state/return_and_refund_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersOprations {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  get firestore => _firebaseFirestore;
  Future<OrderState> readOrders() async {
    final sellerId = AuthRepository().sellerId();

    try {
      final snapshot = await _firebaseFirestore
          .collection('orders')
          .where('sellerId', isEqualTo: sellerId)
          .get();

      return OrderGetSuccessfully(snapshot);
    } catch (e) {
      return OrderError(e.toString());
    }
  }

  Future<OrderState> getReturnRequests() async {
    final sellerId = AuthRepository().sellerId();

    try {
      final snapshot = await _firebaseFirestore
          .collection('return_and_refund')
          .where('sellerId', isEqualTo: sellerId)
          .get();

      return ReturnAndRefundStateGetSuccessfully(snapshot);
    } catch (e) {
      return ReturnAndRefundStateError(e.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getOrder() {
    final sellerId = AuthRepository().sellerId();

    return _firebaseFirestore
        .collection('orders')
        .where('sellerId', isEqualTo: sellerId)
        .snapshots();
  }
  

  Future<UserModel?> getUserData(String userId) async {
    try {
      final doc = await _firebaseFirestore.collection('user').doc(userId).get();

      if (!doc.exists) return null;

      return UserModel.fromMap(doc.data()!);
    } catch (e) {
      return null;
    }
  }

  Future<ProductModel?> getProduct(String productId) async {
    try {
      final doc =
          await _firebaseFirestore.collection('product').doc(productId).get();

      if (!doc.exists) return null;

      return ProductModel.fromMap(doc.data()!);
    } catch (e) {
      return null;
    }
  }

  Future<OrderState> changeRefundStatus(
    String id,
    String newStatus,
  ) async {
    try {
      final docRef = _firebaseFirestore.collection('return_and_refund').doc(id);

      await docRef.update({
        'status': newStatus,
        'isRead': false,
      });

      final doc = await docRef.get();

      if (!doc.exists || doc.data() == null) {
        return OrderError("Order not found");
      }

      final updatedOrder = ReturnRequestModel.fromJson(doc.data()!);

      return ReturnAndRefundStateUpdatedSuccessfully(updatedOrder);
    } catch (e) {
      return ReturnAndRefundStateError("Failed to update order status");
    }
  }

  Future<OrderState> changeOrderStatus(
    String orderId,
    String newStatus,
  ) async {
    try {
      final docRef = _firebaseFirestore.collection('orders').doc(orderId);

      await docRef.set({
        'itemStatus': newStatus,
      }, SetOptions(merge: true));

      final doc = await docRef.get();

      if (!doc.exists || doc.data() == null) {
        return OrderError("Order not found");
      }

      final updatedOrder = OrderModel.fromMap(doc.data()!);

      return OrderUpdatedSuccessfully(updatedOrder);
    } catch (e) {
      return OrderError("Failed to update order status");
    }
  }
}
