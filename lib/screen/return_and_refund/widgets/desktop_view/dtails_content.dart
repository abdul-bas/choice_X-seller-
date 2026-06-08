
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/return_and_refund/return_and_refund.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/request_info.dart';
import 'package:choice_x_seller/screen/return_and_refund/widgets/desktop_view/user_info.dart';
import 'package:flutter/material.dart';


class ReturnDetailsContent extends StatelessWidget {
  const ReturnDetailsContent({
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 12 : 16,
          vertical: 14,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: ReturnRequestInfo(
                request: request,
                isTablet: isTablet,
              ),
            ),
            Expanded(
              flex: 4,
              child: ReturnUserInfo(
                user: user,
                request: request,
                isTablet: isTablet,
              ),
            ),
            SizedBox(width: isTablet ? 110 : 130),
          ],
        ),
      ),
    );
  }
}