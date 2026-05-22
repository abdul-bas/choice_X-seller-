 
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget buildOrderedDetailsRow(
  String label,
  String value, {
  int maxLines = 1,
  IconData? icon,
}) {
  return Row(
    crossAxisAlignment:
        maxLines > 1 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
    children: [
      Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.black87,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.sellerBorder),
        ),
        child: Icon(
          icon ?? Icons.info_outline_rounded,
          size: 13,
          color: AppColors.sellerStepInactive,
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: AppColors.sellerStepInactive,
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.sellerSubtitle,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}