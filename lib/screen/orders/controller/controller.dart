import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/order_event/order_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderLogic {

  static const List<String> orderStatuses = [
    'Pending',
    'Confirmed',
    'Processing',
    'Shipped',
    'Delivered',
    'Cancelled',
  ];

  static List<OrderModel> searchFilter({
    required List<OrderModel> allOrders,
    required String query,
  }) {
    final q = query.toLowerCase().trim();

    return allOrders.where((o) {
      return o.orderId.toLowerCase().contains(q) ||
          o.productName.toLowerCase().contains(q);
    }).toList();
  }

  static void applyOrderSearch({
    required String query,
    required List<OrderModel> allOrders,
    required ValueNotifier<List<OrderModel>?> filteredOrders,
  }) {
    if (query.trim().isEmpty) {
      filteredOrders.value = null;
    } else {
      filteredOrders.value = searchFilter(
        allOrders: allOrders,
        query: query,
      );
    }
  }

  static void submitOrderStatusChange({
    required String? newStatus,
    required OrderModel order,
    required BuildContext context,
  }) {
    if (newStatus != null && newStatus != order.itemStatus) {
      context.read<OrderBloc>().add(
            ChangeOrderItemStatus(
              id: order.orderId,
              status: newStatus,
            ),
          );
    }
  }

  static ({String line1, String line2}) parseCancellationReason(
    String? raw,
  ) {
    if (raw == null) {
      return (
        line1: 'Not Provided',
        line2: '',
      );
    }

    final parts = raw.split('_');

    return (
      line1: parts.isNotEmpty ? parts[0] : 'Not Provided',
      line2: parts.length > 1 ? parts[1] : '',
    );
  }
}