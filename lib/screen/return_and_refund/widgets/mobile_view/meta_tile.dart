import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ReturnMetaTile extends StatelessWidget {
  const ReturnMetaTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.valueColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,             
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 12, color: AppColors.returnLabelMuted),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: AppColors.returnLabelMuted,   
              letterSpacing: 0.9,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: valueColor ?? AppColors.returnValueMuted, 
            ),
          ),
        ],
      ),
    );
  }
}