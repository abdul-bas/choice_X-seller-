  import 'package:choice_x_seller/config/alert_config.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/dialogs/alert_dialog.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_event/return_and_refund_event.dart';

import 'package:choice_x_seller/core/constants/return_statuses.dart';
import 'package:choice_x_seller/core/utils/colors/return_status_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ReturnStatusDropdown extends StatelessWidget {
  const ReturnStatusDropdown({super.key, required this.request});

  final ReturnRequestModel request;

  static const Color _dropdownBg = AppColors.returnDropdownBg; 

  @override
  Widget build(BuildContext context) {
    final statusColor = returnStatusColor(request.status);

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
              border: Border.all(color: statusColor.withValues(alpha: 0.3)),
            ),
            child: Icon(
              Icons.swap_vert_rounded,
              color: statusColor,
              size: 17,
            ),
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
                    color: AppColors.returnLabelMuted, 
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 2),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: returnStatuses.contains(request.status)
                        ? request.status
                        : returnStatuses.first,
                    isExpanded: true,
                    isDense: true,
                    icon: const Icon(
                      Icons.expand_more_rounded,
                      color: AppColors.returnValueMuted, 
                      size: 18,
                    ),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.sellerHeading,  
                    ),
                    dropdownColor: _dropdownBg,
                    borderRadius: BorderRadius.circular(12),
                    items: returnStatuses.map((status) {
                      final sColor = returnStatusColor(status);
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
                                    color: sColor.withValues(alpha: 0.5),
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
                    onChanged: (newStatus) {
                      if (newStatus != null && newStatus != request.status) {
                     showDialog(
  context: context,
  builder: (context) => CustomAlertDialog(
    config: AlertDialogConfig.warning(
      title: 'Update Return & Refund Status',
      content:
          'Are you sure you want to change the return and refund status to "$newStatus"? This action will update the request status and notify the customer.',
      onConfirm: () {
      

        context.read<OrderBloc>().add(
          ChangeReturnAndRefundStatus(
            id: request.requestId,
            status: newStatus,
          ),
        );
      },
    ),
  ),
);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}