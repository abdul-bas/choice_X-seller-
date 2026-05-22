import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_datails.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_product_info.dart';
import 'package:flutter/material.dart';

Widget buildOrderDetailsContent(OrderModel order, bool isTablet) {
  return Container(
    decoration: const BoxDecoration(color: AppColors.black87),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 12 : 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 6, child: buildOrderProductInfo(order, isTablet)),
          Expanded(flex: 4, child: buildOrderDetails(order, isTablet)),
          SizedBox(width: isTablet ? 110 : 130, child: const SizedBox()),
        ],
      ),
    ),
  );
}