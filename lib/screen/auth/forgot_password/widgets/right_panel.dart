import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/back_button.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/email_field.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/security_note.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordRightPanel extends StatelessWidget {
  final TextEditingController email;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordRightPanel({super.key, 
    required this.email,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        height: double.infinity,
        color: AppColors.sellerBg,
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(48),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 340),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your email',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'We\'ll send the reset link here.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.white.withValues(alpha: 0.30),
                      ),
                    ),
                    const SizedBox(height: 36),
                    ForgotPasswordEmailField(email: email),
                    const SizedBox(height: 24),
                    ForgotPasswordSubmitButton(email: email, formKey: formKey),
                    const SizedBox(height: 16),
                    const ForgotPasswordSecurityNote(),
                    const SizedBox(height: 28),
                    Center(child: ForgotPasswordBackButton()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
