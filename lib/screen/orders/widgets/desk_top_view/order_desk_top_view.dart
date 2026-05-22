import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_header_row.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_item_wrapper.dart';
import 'package:flutter/material.dart';

Widget buildOrderDesktopView(
  List<OrderModel> filteredOrders,
  bool isTablet,
  BuildContext context,
  OrdersOprations getOrders,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: isTablet ? 12 : 20),
    child: Column(
      children: [
        buildOrderHeaderRow(isTablet),
        const Divider(
            color: AppColors.sellerWhite10, height: 1, thickness: 1),
        ListView.builder(
          itemCount: filteredOrders.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (context, index) => OrderItemWrapper(
            order: filteredOrders[index],
            isTablet: isTablet,
            getOrders: getOrders,
          ),
        ),
      ],
    ),
  );
}