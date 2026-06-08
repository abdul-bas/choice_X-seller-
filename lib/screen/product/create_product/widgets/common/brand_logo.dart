import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
            children: [
              TextSpan(text: 'choice'),
              TextSpan(text: 'X', style: TextStyle(color: AppColors.tealPale)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          "India's next-generation seller marketplace",
          style: TextStyle(
              fontSize: 12, color: AppColors.lavender, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}