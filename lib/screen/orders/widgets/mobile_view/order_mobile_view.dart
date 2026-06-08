import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/screen/orders/widgets/mobile_view/mobile_order_item_wrapper.dart';
import 'package:flutter/material.dart';

Widget buildOrderMobileView(
  List<OrderModel> filteredOrders,
  BuildContext context,
  OrdersOprations getOrders,
) {
  return ListView.separated(
    shrinkWrap: true,
    physics: const ScrollPhysics(),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    itemCount: filteredOrders.length,
    separatorBuilder: (_, __) => const SizedBox(height: 16),
    itemBuilder: (_, i) => MobileOrderItemWrapper(
      order: filteredOrders[i],
      getOrders: getOrders,
    ),
  );
}