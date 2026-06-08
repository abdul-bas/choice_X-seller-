
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/back_button.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/email_field.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/head_line.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/security_note.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/step_badge.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/submit_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobileLayout extends StatelessWidget {
  final TextEditingController email;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordMobileLayout({super.key, 
    required this.email,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(28, 60, 28, 36),
          decoration:  BoxDecoration(
            gradient: AuthController. forgotPanelGradient(),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ForgotPasswordBadge(),
              SizedBox(height: 24),
              ForgotPasswordHeadline(),
            ],
          ),
        ),

       
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 36, 28, 48),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ForgotPasswordEmailField(email: email),
                  const SizedBox(height: 24),
                  ForgotPasswordSubmitButton(
                      email: email, formKey: formKey),
                  const SizedBox(height: 14),
                  const ForgotPasswordSecurityNote(),
                  const SizedBox(height: 24),
                  Center(child: ForgotPasswordBackButton()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
