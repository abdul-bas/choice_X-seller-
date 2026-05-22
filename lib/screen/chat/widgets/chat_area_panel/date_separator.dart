import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SellerDateSeparator extends StatelessWidget {
  const SellerDateSeparator({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.sellerBorder,                 
              height: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.sellerSurface,              
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.sellerBorder),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textSubdued,               
                letterSpacing: 0.3,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.sellerBorder,                
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}