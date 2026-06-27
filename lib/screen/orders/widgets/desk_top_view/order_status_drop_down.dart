<<<<<<< HEAD
import 'package:choice_x_seller/config/alert_config.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/dialogs/alert_dialog.dart';
=======
import 'package:choice_x_seller/core/constants/app_colors.dart';
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/screen/orders/controller/controller.dart';
import 'package:choice_x_seller/core/constants/order_statuses.dart';
import 'package:choice_x_seller/core/utils/colors/order_status_colors.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
=======

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
Widget buildOrderStatusDropdown(
  OrderModel order,
  bool isTablet,
  BuildContext context,
) {
  return Container(
    height: isTablet ? 34 : 38,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: AppColors.sellerSurface,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.sellerBorder, width: 1),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
<<<<<<< HEAD
          value: orderStatuses.contains(order.itemStatus)
              ? order.itemStatus
              : orderStatuses.first,
          isExpanded: true,
          icon: Icon(Icons.expand_more_rounded,
              color: AppColors.sellerWhite70, size: isTablet ? 18 : 20),
          style: TextStyle(
            fontSize: isTablet ? 10 : 11,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
          dropdownColor: AppColors.sellerSurface,
          borderRadius: BorderRadius.circular(12),
          menuMaxHeight: 300,
          items: orderStatuses.map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: getOrderStatusColor(status),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: isTablet ? 10 : 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (newStatus) {
          
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                  config: AlertDialogConfig.warning(
                title: 'Update Order Status',
                content:
                    'Are you sure you want to update this order status to "$newStatus"? This change will be visible to the customer.',
                onConfirm: () {
                  OrderLogic.submitOrderStatusChange(
                    newStatus: newStatus,
                    order: order,
                    context: context,
                  );
                },
              )),
            );
          }),
    ),
  );
}
=======
        value: orderStatuses.contains(order.itemStatus)
            ? order.itemStatus
            : orderStatuses.first,
        isExpanded: true,
        icon: Icon(Icons.expand_more_rounded,
            color: AppColors.sellerWhite70, size: isTablet ? 18 : 20),
        style: TextStyle(
          fontSize: isTablet ? 10 : 11,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
        dropdownColor: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(12),
        menuMaxHeight: 300,
        items: orderStatuses.map((String status) {
          return DropdownMenuItem<String>(
            value: status,
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                  
                    color: getOrderStatusColor(status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: isTablet ? 10 : 11,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: (newStatus) =>OrderLogic. submitOrderStatusChange(
          newStatus: newStatus,
          order: order,
          context: context,
        ),
      ),
    ),
  );
}
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
