
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class ReturnDetailRow extends StatelessWidget {
  const ReturnDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.maxLines = 1,
  });

  final IconData icon;
  final String label;
  final String value;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: maxLines > 1
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: AppColors.sellerSurface,         
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.sellerBorder), 
          ),
          child: const Icon(
            Icons.circle,                            
            size: 13,
            color: AppColors.returnLabelMuted,       
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: AppColors.returnLabelMuted, 
                  letterSpacing: 0.7,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.returnValueMuted, 
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}