 
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordHeadline extends StatelessWidget {
  const ForgotPasswordHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Reset\n',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  color: AppColors.white,
                  height: 1.0,
                  letterSpacing: -1.5,
                ),
              ),
              TextSpan(
                text: 'your access.',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..shader =AuthController. forgotBrandGradient().createShader(
                      const Rect.fromLTWH(0, 0, 300, 60),
                    ),
                  height: 1.0,
                  letterSpacing: -1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Enter your email and we\'ll send\na secure reset link right away.',
          style: TextStyle(
            fontSize: 13,
            color: AppColors.white.withValues(alpha: 0.35),
            height: 1.7,
          ),
        ),
      ],
    );
  }
}