import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget variantSectionLabel(String text) => Row(children: [
      Container(
        width:  3,
        height: 14,
        decoration: BoxDecoration(
          color:        AppColors.brand,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(color: AppColors.shadowBrand, blurRadius: 6),
          ],
        ),
      ),
      const SizedBox(width: 8),
      Text(
        text.toUpperCase(),
        style: const TextStyle(
          fontSize:      10.5,
          fontWeight:    FontWeight.w700,
          color:         AppColors.variantLabelMuted,
          letterSpacing: 1.4,
        ),
      ),
    ]);
