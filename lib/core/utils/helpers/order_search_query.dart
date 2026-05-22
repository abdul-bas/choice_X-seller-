import 'package:choice_x_seller/models/order_model/order_model.dart';

List<OrderModel> searchFilter({
  required List<OrderModel> allOrders,
  required String query,
}) {
  final q = query.toLowerCase().trim();

  if (q.isEmpty) {
    return List.from(allOrders);
  }

  return allOrders.where((order) {
    return order.orderId.toLowerCase().contains(q) ||
        order.amount.toString().contains(q) ||
        order.date.toString().toLowerCase().contains(q) ||
        order.itemStatus.toLowerCase().contains(q) ||
        order.paymentStatus.toLowerCase().contains(q) ||
        order.paymentMethod.toLowerCase().contains(q) ||
        order.paymentAddress.toLowerCase().contains(q) ||
        order.quantity.toString().contains(q);
  }).toList();
}

