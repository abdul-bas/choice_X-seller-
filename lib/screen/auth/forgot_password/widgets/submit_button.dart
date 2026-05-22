
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordSubmitButton extends StatelessWidget {
  final TextEditingController email;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordSubmitButton({
    super.key,
    required this.email,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>AuthController. submitForgotPassword(
        formKey: formKey,
        emailController: email,
        context: context,
      ),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient:AuthController. forgotSubmitGradient(),
          boxShadow: [
            BoxShadow(
              color: AppColors.brand.withValues(alpha: 0.30),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Send Reset Link',
              style: GoogleFonts.robotoSlab(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white.withValues(alpha: 0.15),
              ),
              child: const Icon(
                Icons.arrow_forward_rounded,
                size: 14,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
