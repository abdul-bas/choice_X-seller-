
  import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ProductReadSectionHeader extends StatelessWidget {
  const ProductReadSectionHeader({super.key, this.onViewDetails});

  final VoidCallback? onViewDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.info_outline_rounded,
          size: 20,
          color: AppColors.white,                       
        ),
        const SizedBox(width: 8),
        const Text(
          'Product Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.white,                     
            letterSpacing: 0.3,
          ),
        ),
        const Spacer(),
        if (onViewDetails != null)
          TextButton(
            onPressed: onViewDetails,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            child: const Row(
              children: [
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,            
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                  color: AppColors.white,              
                ),
              ],
            ),
          ),
      ],
    );
  }
}
