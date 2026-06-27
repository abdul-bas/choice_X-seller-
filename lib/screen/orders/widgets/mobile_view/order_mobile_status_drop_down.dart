import 'package:choice_x_seller/config/alert_config.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/dialogs/alert_dialog.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/screen/orders/controller/controller.dart';
import 'package:choice_x_seller/core/constants/order_statuses.dart';
import 'package:choice_x_seller/core/utils/colors/order_status_colors.dart';
import 'package:flutter/material.dart';

Widget buildOrderMobileStatusDropdown(
  OrderModel currentOrder,
  BuildContext context,
  dynamic order,
) {
  final statusColor = getOrderStatusColor(currentOrder.itemStatus);

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.sellerSurface,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.sellerBorder),
    ),
    child: Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: statusColor.withValues(alpha: 0.30)),
          ),
          child: Icon(Icons.swap_vert_rounded, color: statusColor, size: 17),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'UPDATE STATUS',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.sellerStepInactive,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 2),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: orderStatuses.contains(order.itemStatus)
                        ? order.itemStatus
                        : orderStatuses.first,
                    isExpanded: true,
                    isDense: true,
                    icon: const Icon(Icons.expand_more_rounded,
                        color: AppColors.sellerSubtitle, size: 18),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.sellerHeading,
                    ),
                    dropdownColor: AppColors.sellerSurface,
                    borderRadius: BorderRadius.circular(12),
                    items: orderStatuses.map((String status) {
                      final sColor = getOrderStatusColor(status);
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Row(
                          children: [
                            Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                color: sColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: sColor.withValues(alpha: 0.50),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              status,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: AppColors.sellerHeading,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (newStatus) => showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                                config: AlertDialogConfig.warning(
                              title: 'Update Order Status',
                              content: 'Are you sure you want to update this order status to "$newStatus"? This change will be visible to the customer.',
                              onConfirm: () {
                                OrderLogic.submitOrderStatusChange(
                                  newStatus: newStatus,
                                  order: order,
                                  context: context,
                                );
                              },
                            ));
                      }
                    )),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
