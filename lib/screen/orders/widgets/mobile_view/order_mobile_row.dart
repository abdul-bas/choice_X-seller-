

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget mobileOrderRow(
  String label,
  String value, {
  Color? color, 
  IconData? icon,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: AppColors.black87,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.sellerBorder),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 12, color: AppColors.sellerStepInactive),
          const SizedBox(height: 4),
        ],
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            color: AppColors.sellerStepInactive,
            letterSpacing: 0.9,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: color ?? AppColors.sellerSubtitle,
          ),
        ),
      ],
    ),
  );
}
