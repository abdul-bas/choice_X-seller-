
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/left_panel.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/widgets/right_panel.dart';
import 'package:flutter/material.dart';

class ForgotPasswordDesktopLayout extends StatelessWidget {
  final TextEditingController email;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordDesktopLayout({super.key, 
    required this.email,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ForgotPasswordLeftPanel(),
        ForgotPasswordRightPanel(email: email, formKey: formKey),
      ],
    );
  }
}