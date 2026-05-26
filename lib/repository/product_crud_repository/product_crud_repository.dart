import 'package:choice_x_seller/models/product_model/product_model.dart';
import 'package:choice_x_seller/state/bloc/product_add/order_status.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductCrudRepository {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<ProductCrudState> addProduct({required ProductModel model}) async {
    try {
 print('images: ${model.imges}');
    print('variants: ${model.variants}');

    final data = model.toMap();

    print('Firestore data: $data');
      await _firebaseFirestore
          .collection('product')
          .doc(model.id)
          .set(model.toMap(),SetOptions(merge: true));

      return ProductLoaded(
        message: "Product added successfully!",
        scaffoldHeadText: "Success",
        scaffoldSubText: "${model.model} added successfully.",
        icon: Icons.check_circle_outline,
        color: Colors.green,
      );
    } on FirebaseException catch (e) {
      return ProductError(
        message: e.message ?? "Something went wrong",
        scaffoldHeadText: "Firebase Error",
        scaffoldSubText: e.message ?? "Failed to add product.",
        icon: Icons.error_outline,
        color: Colors.red,
      );
    } catch (e) {
      return ProductError(
        message: e.toString(),
        scaffoldHeadText: "Unexpected Error",
        scaffoldSubText: "Please try again later.",
        icon: Icons.error_outline,
        color: Colors.red,
      );
    }
  }

  Stream<QuerySnapshot> getProduct() {
    try {
      return _firebaseFirestore.collection('product').snapshots();
    } catch (e) {
      return const Stream.empty();
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getParticularProduct(
      String productId) {
    try {
      return _firebaseFirestore
          .collection('product')
          .doc(productId)
          .snapshots();
    } catch (e) {
      return const Stream.empty();
    }
  }

  Future<ProductCrudState> updateProduct(ProductModel model) async {
    try {
      print("Product Name: ${model.productName}");
      print("Model: ${model.model}");
      print("Variants: ${model.variants}");
      print("Images: ${model.imges}");
      await _firebaseFirestore
          .collection('product')
          .doc(model.id)
          .set(model.toMap(), SetOptions(merge: true));

      return ProductLoaded(
        message: 'Product updated successfully!',
        scaffoldHeadText: 'Update Successful',
        scaffoldSubText: 'The product details were updated correctly.',
        icon: Icons.check_circle,
        color: Colors.green,
      );
    } catch (e) {
      return ProductError(
        message: 'Failed to update product: $e',
        scaffoldHeadText: 'Update Failed',
        scaffoldSubText: 'Something went wrong while updating.',
        icon: Icons.error,
        color: Colors.red,
      );
    }
  }

  Future<ProductCrudState> productDelete(ProductModel model) async {
    try {
      await _firebaseFirestore.collection('product').doc(model.id).delete();
      return ProductLoaded(
        message: 'Product deleted successfully!',
        scaffoldHeadText: 'Delete Successful',
        scaffoldSubText: 'The product was removed from your list.',
        icon: Icons.check_circle,
        color: Colors.red,
      );
    } catch (e) {
      return ProductError(
        message: 'Failed to delete product: $e',
        scaffoldHeadText: 'Delete Failed',
        scaffoldSubText: 'Something went wrong while deleting the product.',
        icon: Icons.error,
        color: Colors.red,
      );
    }
  }

  Future<ProductCrudState> statusUpdate(ProductModel model) async {
    try {
      _firebaseFirestore
          .collection('product')
          .doc(model.id)
          .update({'status': model.status});
      return ProductLoaded(
        message: 'Product status updated successfully!',
        scaffoldHeadText: 'Status Updated',
        scaffoldSubText: 'The product is now marked as $model.',
        icon: Icons.check_circle,
        color: Colors.green,
      );
    } catch (e) {
      return ProductError(
        message: 'Failed to update product status: $e',
        scaffoldHeadText: 'Update Failed',
        scaffoldSubText: 'Something went wrong while updating status.',
        icon: Icons.error,
        color: Colors.red,
      );
    }
  }

  Future<ProductCrudState> updateOrderStatus({
    required String orderId,
    required String itemId,
    required String newStatus,
  }) async {
    try {
      final orderRef = _firebaseFirestore.collection('orders').doc(orderId);
      final snapshot = await orderRef.get();

      if (!snapshot.exists) {
        return OrderStatusError("Order not found");
      }

      final data = snapshot.data()!;
      List items = List.from(data['items']);

      for (int i = 0; i < items.length; i++) {
        if (items[i]['itemId'] == itemId) {
          items[i]['itemStatus'] = newStatus;
        }
      }

      await orderRef.update({'items': items});

      return OrderStatusUpdated("Order status updated", newStatus);
    } catch (e) {
      return OrderStatusError(e.toString());
    }
  }
}
