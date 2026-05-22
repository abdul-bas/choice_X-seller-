import 'dart:convert';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_info_row.dart';
import 'package:flutter/material.dart';

Widget buildOrderProductInfo(OrderModel order, bool isTablet) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: isTablet ? 75 : 85,
        width: isTablet ? 55 : 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: MemoryImage(base64Decode(order.images)),
            fit: BoxFit.cover,
          ),
          border: Border.all(color: AppColors.sellerWhite10, width: 1),
        ),
      ),
      SizedBox(width: isTablet ? 10 : 14),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildOrderInfoRow('Product:', order.productName, isTablet),
            SizedBox(height: isTablet ? 4 : 6),
            buildOrderInfoRow('Model:', order.model, isTablet),
            SizedBox(height: isTablet ? 4 : 6),
            buildOrderInfoRow('Brand:', order.brand, isTablet),
            SizedBox(height: isTablet ? 4 : 6),
            buildOrderInfoRow(
              'Quantity:',
              '${order.quantity} × ₹${order.discountPrice.toInt()}',
              isTablet,
            ),
          ],
        ),
      ),
    ],
  );
}
