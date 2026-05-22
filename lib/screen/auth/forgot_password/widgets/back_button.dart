import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBackButton extends StatelessWidget {
  const ForgotPasswordBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_back_rounded,
            size: 14,
            color: AppColors.white.withValues(alpha: 0.28),
          ),
          const SizedBox(width: 6),
          Text(
            'Back to Sign In',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.white.withValues(alpha: 0.28),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}