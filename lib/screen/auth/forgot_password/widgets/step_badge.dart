
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBadge extends StatelessWidget {
  const ForgotPasswordBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AuthController. forgotBrandGradient(),
            ),
            child: const Icon(
              Icons.lock_open_rounded,
              size: 10,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'ACCOUNT RECOVERY',
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: AppColors.white.withValues(alpha: 0.45),
              letterSpacing: 2.2,
            ),
          ),
        ],
      ),
    );
  }
}
