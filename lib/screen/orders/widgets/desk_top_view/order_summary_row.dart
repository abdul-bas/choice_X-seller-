
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/get_formatted_id.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/core/utils/colors/order_status_colors.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_status_drop_down.dart';
import 'package:flutter/material.dart';

Widget buildOrderSummaryRow(
  OrderModel order,
  UserModel user,
  bool isTablet,
  BuildContext context,
) {
  return Container(
    color: AppColors.sellerSurface,
    padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 12 : 16, vertical: 14),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            groupedTxn(order.orderId),
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              fontSize: isTablet ? 11 : 12,
              color: AppColors.sellerWhite70,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            user.name,
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              fontSize: isTablet ? 11 : 12,
              color: AppColors.sellerWhite70,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            order.itemStatus,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isTablet ? 10 : 11,
              
              color: getOrderStatusColor(order.itemStatus),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            order.paymentStatus,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: isTablet ? 11 : 12,
              color: AppColors.sellerWhite70,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            '₹${order.amount}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isTablet ? 11 : 12,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(
          width: isTablet ? 110 : 130,
          child: buildOrderStatusDropdown(order, isTablet, context),
        ),
      ],
    ),
  );
}