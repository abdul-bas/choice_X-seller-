import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/order_model/order_model.dart';
import 'package:choice_x_seller/screen/orders/controller/controller.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_details_content.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_details_header.dart';
import 'package:choice_x_seller/screen/orders/widgets/desk_top_view/order_summary_row.dart';
import 'package:flutter/material.dart';

Widget buildCancelledOrderCard(
  OrderModel order,
  dynamic user,
  bool isTablet,
  BuildContext context,
) {
  final reason = OrderLogic.parseCancellationReason(order.cancellationReason);

  return Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.chatBubbleReceiver,
          border: Border.all(
              color: AppColors.dangerDark.withValues(alpha: 0.40), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Opacity(
                opacity: 0.40,
                child: Column(
                  children: [
                    buildOrderSummaryRow(order, user, isTablet, context),
                    buildOrderDetailsHeader(isTablet),
                    buildOrderDetailsContent(order, isTablet),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.dangerDark.withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.dangerDark.withValues(alpha: 0.50),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.info_outline,
                          color: AppColors.danger, size: 15),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Cancellation Reason',
                              style: TextStyle(
                                color: AppColors.danger,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              reason.line1,
                              style: const TextStyle(
                                color: AppColors.grey300,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              reason.line2,
                              style: const TextStyle(
                                color: AppColors.grey300,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.dangerDark.withValues(alpha: 0.20),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.dangerDark.withValues(alpha: 0.50),
                      width: 1,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.cancel_outlined,
                          color: AppColors.dangerDark, size: 13),
                      SizedBox(width: 5),
                      Text(
                        'CANCELLED',
                        style: TextStyle(
                          color: AppColors.dangerDark,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
