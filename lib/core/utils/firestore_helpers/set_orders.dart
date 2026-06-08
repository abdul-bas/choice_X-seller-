import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 List<OrderModel> setOrders({
    required List<QueryDocumentSnapshot<Map<String, dynamic>>> orders,
  }) {
   

    return orders.map((e) => OrderModel.fromMap(e.data())).toList();

  
  }