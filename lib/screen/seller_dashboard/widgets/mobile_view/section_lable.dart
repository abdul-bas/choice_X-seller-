
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class DashboardSectionLabel extends StatelessWidget {
  const DashboardSectionLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.2), 
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text.toUpperCase(),
          style: TextStyle(
            color: AppColors.white.withValues(alpha: 0.4),
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}