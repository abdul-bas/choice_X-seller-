
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReturnAndRefundStateLoading extends OrderState {}

class ReturnAndRefundStateLoaded extends OrderState {
  final String message;

  ReturnAndRefundStateLoaded(this.message);
}
class ReturnAndRefundStateUpdatedSuccessfully extends OrderState {
  final ReturnRequestModel requestModel;

  ReturnAndRefundStateUpdatedSuccessfully(this.requestModel);
}class ReturnAndRefundStateGetSuccessfully extends OrderState {
  final QuerySnapshot<Map<String, dynamic>> snapshot;

  ReturnAndRefundStateGetSuccessfully(this.snapshot);
}

class ReturnAndRefundStateError extends OrderState {
  final String message;

  ReturnAndRefundStateError(this.message);
}
