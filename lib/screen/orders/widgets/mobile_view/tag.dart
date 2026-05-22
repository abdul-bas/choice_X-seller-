import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.sellerSurfaceDeep,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: AppColors.sellerBorder),
      ),
      child: const Text(
        '',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.sellerSubtitle,
        ),
      ),
    );
  }
}
