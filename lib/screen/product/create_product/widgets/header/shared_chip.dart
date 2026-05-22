
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SharedChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const SharedChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppColors.sellerBodyText),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: AppColors.sellerBodyText,
            ),
          ),
        ],
      ),
    );
  }
}
