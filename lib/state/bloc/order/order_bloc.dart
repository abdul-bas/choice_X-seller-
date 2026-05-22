import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/state/bloc/order/initial_status.dart';
import 'package:choice_x_seller/state/bloc/order/order_event/order_event.dart';
import 'package:choice_x_seller/state/bloc/order/order_state/order_state.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_event/return_and_refund_event.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_state/return_and_refund_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrdersOprations _oprations = OrdersOprations();
  OrderBloc() : super(OrderInitial()) {
    on<ChangeOrderItemStatus>((event, emit) async {
      emit(OrderLoading());
      final resulte =
          await _oprations.changeOrderStatus(event.id, event.status);
      emit(resulte);
    });
    on<ReadOrders>((event, emit) async {
      emit(OrderLoading());
      final resulte = await _oprations.readOrders();
      emit(resulte);
    });
    on<ReadReturnAndRefund>((event, emit) async {
      emit(ReturnAndRefundStateLoading());
      final resulte = await _oprations.getReturnRequests();

      emit(resulte);
    });
     on<ChangeReturnAndRefundStatus>((event, emit) async {
      emit(ReturnAndRefundStateLoading());
      final resulte = await _oprations.changeRefundStatus(event.id,event.status);

      emit(resulte);
    });
  }
}
