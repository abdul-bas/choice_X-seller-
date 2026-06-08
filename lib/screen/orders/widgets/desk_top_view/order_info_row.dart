import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildOrderInfoRow(
  String label,
  String value,
  bool isTablet, {
  double? width,
  int maxLines = 1,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: width ?? (isTablet ? 75 : 85),
        child: Text(
          label,
          style: TextStyle(
            fontSize: isTablet ? 10 : 11,
            color: AppColors.sellerWhite54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      Expanded(
        child: Text(
          value,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: isTablet ? 10 : 11,
            color: AppColors.sellerWhite70,
          ),
        ),
      ),
    ],
  );
}
