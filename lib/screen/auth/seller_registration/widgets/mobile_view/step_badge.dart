

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class StepBadge extends StatelessWidget {
  const StepBadge({super.key, required this.current, required this.total});

  final int current, total;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.sellerSurface,            
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: AppColors.sellerBorder), 
        ),
        child: Text(
          '$current of $total',
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: AppColors.sellerWhite70,            
          ),
        ),
      );
}