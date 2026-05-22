import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
Widget sellerAccessRing(double size, double opacity) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: AppColors.white.withValues(alpha: opacity),
        width: 1,
      ),
    ),
  );
}