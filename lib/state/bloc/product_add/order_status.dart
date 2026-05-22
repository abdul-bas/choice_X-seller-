import 'package:choice_x_seller/state/bloc/product_add/product_crud_event.dart';
import 'package:choice_x_seller/state/bloc/product_add/product_crud_state.dart';

class ChangeOrderStatus extends ProductCrudEvent {
  final String orderId;
  final String itemId;
  final String newStatus;

  ChangeOrderStatus({
    required this.orderId,
    required this.itemId,
    required this.newStatus,
  });
}

class OrderStatusUpdating extends ProductCrudState {}

class OrderStatusUpdated extends ProductCrudState {
  final String message;
  final String newStatus;
  OrderStatusUpdated(this.message,this.newStatus);
}

class OrderStatusError extends ProductCrudState {
  final String error;
  OrderStatusError(this.error);
}
