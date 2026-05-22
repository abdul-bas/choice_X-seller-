

  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/get_formatted_id.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/core/utils/colors/return_status_color.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/common/return_status_dropdown_inline.dart';
import 'package:flutter/material.dart';


class ReturnSummaryRow extends StatelessWidget {
  const ReturnSummaryRow({
    super.key,
    required this.request,
    required this.user,
    required this.isTablet,
  });

  final ReturnRequestModel request;
  final UserModel user;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.sellerSurface,              
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 12 : 16,
        vertical: 14,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    groupedTxn(request.requestId),
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                      fontSize: isTablet ? 11 : 12,
                      color: AppColors.sellerWhite70,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              groupedTxn(request.orderId),
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
              request.type,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isTablet ? 10 : 11,
                color: AppColors.danger.withValues(alpha: 0.7), 
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              request.status,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: isTablet ? 10 : 11,
                color: returnStatusColor(request.status),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              groupedTxn(request.paymentId),
              maxLines: 1,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                fontSize: isTablet ? 11 : 12,
                color: AppColors.sellerWhite70,     
              ),
            ),
          ),
          SizedBox(
            width: isTablet ? 110 : 130,
            child: ReturnStatusDropdownInline(
              request: request,
              isTablet: isTablet,
            ),
          ),
        ],
      ),
    );
  }
}