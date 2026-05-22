
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget variantIconBtn(
  IconData icon, {
  required VoidCallback onTap,
  Color? color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width:  34,
        height: 34,
        decoration: BoxDecoration(
          color:        AppColors.variantSurfaceMid,
          borderRadius: BorderRadius.circular(10),
          border:       Border.all(color: AppColors.variantBorder),
        ),
        child: Icon(icon, size: 16, color: color ?? AppColors.variantLabelMuted),
      ),
    );
