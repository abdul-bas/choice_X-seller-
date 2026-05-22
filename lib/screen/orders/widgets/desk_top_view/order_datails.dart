import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/core/utils/helpers/date_formatter.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_info_row.dart';
import 'package:flutter/material.dart';

Widget buildOrderDetails(OrderModel order, bool isTablet) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildOrderInfoRow('Order Date:', formatDate(order.date), isTablet,
          width: isTablet ? 105 : 125),
      SizedBox(height: isTablet ? 4 : 6),
      buildOrderInfoRow('Payment Method:', order.paymentMethod, isTablet,
          width: isTablet ? 105 : 125, maxLines: 2),
      SizedBox(height: isTablet ? 4 : 6),
      buildOrderInfoRow('Shipping Address:', order.paymentAddress, isTablet,
          width: isTablet ? 105 : 125, maxLines: 3),
    ],
  );
}