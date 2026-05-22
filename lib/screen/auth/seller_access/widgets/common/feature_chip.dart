
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SellerFeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const SellerFeatureChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.sellerWhite10,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.white.withValues(alpha: 0.45)),
          const SizedBox(width: 7),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.white.withValues(alpha: 0.45),
            ),
          ),
        ],
      ),
    );
  }
}