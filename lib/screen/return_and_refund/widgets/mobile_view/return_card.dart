import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/get_formatted_id.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';

import 'package:choice_x_seller/core/utils/colors/return_status_color.dart';
import 'package:choice_x_seller/core/utils/helpers/date_formatter.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/detail_row.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/meta_tile.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/reason_box.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/section_label.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/mobile_view/status_badge.dart';
import 'package:flutter/material.dart';


class ReturnCard extends StatelessWidget {
  const ReturnCard({
    super.key,
    required this.request,
    required this.userName,
  });

  final ReturnRequestModel request;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final statusColor = returnStatusColor(request.status);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,               
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.sellerBorder), 
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.4), 
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: statusColor.withValues(alpha: 0.05),
            blurRadius: 30,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'REQUEST ID',
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: AppColors.returnLabelMuted, 
                          letterSpacing: 1.3,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        groupedTxn(request.requestId),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.sellerHeading, 
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                ReturnStatusBadge(label: request.status, color: statusColor),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ReturnMetaTile(
                    icon: Icons.person_outline_rounded,
                    label: 'Customer',
                    value: userName,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ReturnMetaTile(
                    icon: Icons.loop_rounded,
                    label: 'Type',
                    value: request.type,
                    valueColor: AppColors.danger.withValues(alpha: 0.8), 
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ReturnMetaTile(
                    icon: Icons.tag_rounded,
                    label: 'Order ID',
                    value: groupedTxn(request.orderId),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const ReturnSectionLabel(label: 'Request Details'),
            const SizedBox(height: 12),
            ReturnReasonBox(reason: request.reason),
            const SizedBox(height: 10),
            ReturnDetailRow(
              icon: Icons.calendar_today_outlined,
              label: 'Requested',
              value: formatDate(request.createdAt),
            ),
            const SizedBox(height: 8),
            ReturnDetailRow(
              icon: Icons.receipt_outlined,
              label: 'Payment ID',
              value: groupedTxn(request.paymentId),
            ),
            const SizedBox(height: 8),
            ReturnDetailRow(
              icon: Icons.storefront_outlined,
              label: 'Seller ID',
              value: groupedTxn(request.sellerId),
            ),
          ],
        ),
      ),
    );
  }
}
