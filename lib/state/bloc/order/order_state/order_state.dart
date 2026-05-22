


import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class OrderState {}


class OrderLoading extends OrderState {}

class OrderLoaded extends OrderState {
  final String message;

  OrderLoaded(this.message);
}
class OrderUpdatedSuccessfully extends OrderState {
  final OrderModel order;

  OrderUpdatedSuccessfully(this.order);
}

class OrderGetSuccessfully extends OrderState {
  final QuerySnapshot<Map<String, dynamic>> orders;

  OrderGetSuccessfully(this.orders);
}

class OrderError extends OrderState {
  final String message;

  OrderError(this.message);
}



