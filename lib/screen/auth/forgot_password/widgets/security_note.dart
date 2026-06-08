
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSecurityNote extends StatelessWidget {
  const ForgotPasswordSecurityNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.06)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.shield_outlined,
            size: 14,
            color: AppColors.brand.withValues(alpha: 0.70),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Link expires in 15 minutes · One-time use only',
              style: TextStyle(
                fontSize: 10,
                color: AppColors.white.withValues(alpha: 0.25),
                letterSpacing: 0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
