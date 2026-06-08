import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/seller_access/widgets/common/seller_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordEmailField extends StatelessWidget {
  final TextEditingController email;

  const ForgotPasswordEmailField({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: AppColors.white.withValues(alpha: 0.45),
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          validator:AuthController. validateForgotPasswordEmail,
          style: GoogleFonts.robotoSlab(
            color: AppColors.white,
            fontSize: 12,
          ),
          decoration: buildSellerFieldDecoration(
            hint: 'you@example.com',
            prefix: const Icon(Icons.alternate_email_rounded, size: 17),
          ),
        ),
      ],
    );
  }
}