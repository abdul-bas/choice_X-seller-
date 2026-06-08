
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class ReturnStatusBadge extends StatelessWidget {
  const ReturnStatusBadge({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,          
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.7),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.sellerWhite70,       
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}