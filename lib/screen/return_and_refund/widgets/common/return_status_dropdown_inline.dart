

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/constants/return_statuses.dart';
import 'package:choice_x_seller/core/utils/colors/return_status_color.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/state/bloc/order/order_bloc.dart';
import 'package:choice_x_seller/state/bloc/order/return_and_refund_event/return_and_refund_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ReturnStatusDropdownInline extends StatelessWidget {
  const ReturnStatusDropdownInline({
    super.key,
    required this.request,
    required this.isTablet,
  });

  final ReturnRequestModel request;
  final bool isTablet;

  static const Color _dropdownBg = AppColors.returnDropdownBg2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTablet ? 34 : 38,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.sellerBg,                 
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder, width: 1), 
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: returnStatuses.contains(request.status)
              ? request.status
              : returnStatuses.first,
          isExpanded: true,
          icon: Icon(
            Icons.expand_more_rounded,
            color: AppColors.sellerWhite70,        
            size: isTablet ? 18 : 20,
          ),
          style: TextStyle(
            fontSize: isTablet ? 10 : 11,
            fontWeight: FontWeight.w600,
            color: AppColors.white,              
          ),
          dropdownColor: _dropdownBg,               
          borderRadius: BorderRadius.circular(12),
          menuMaxHeight: 300,
          items: returnStatuses.map((status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: returnStatusColor(status),
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
            if (newStatus != null && newStatus != request.status) {
              context.read<OrderBloc>().add(
                    ChangeReturnAndRefundStatus(
                      id: request.requestId,
                      status: newStatus,
                    ),
                  );
            }
          },
        ),
      ),
    );
  }
}