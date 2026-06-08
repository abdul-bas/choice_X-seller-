
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget sellerAccessLabel(String text, double? fontSize) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontSize ?? 12,
      fontWeight: FontWeight.w600,
      color: AppColors.white.withValues(alpha: 0.50),
    ),
  );
}
