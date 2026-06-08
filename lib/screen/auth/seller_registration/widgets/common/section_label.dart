

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SellerRegistrationSecLabel extends StatelessWidget {
  const SellerRegistrationSecLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Container(
            width: 3,
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: AppColors.white,                 
            ),
          ),
          const SizedBox(width: 9),
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 9.5,
              fontWeight: FontWeight.w900,
              color: AppColors.white,                  
              letterSpacing: 1.8,
            ),
          ),
        ],
      );
}