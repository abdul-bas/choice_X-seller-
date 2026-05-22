import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/auth/controller/controller.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/desk_top_layout/desk_top_layout.dart';
import 'package:choice_x_seller/screen/auth/forgot_password/mobile_layout/mobile_layout.dart';
import 'package:choice_x_seller/screen/auth/listeners/auth_update_password.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return authUpdatePasswordListener(
      context: context,
      child: Scaffold(
        backgroundColor: AppColors.sellerBg,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <
                AuthController.kForgotPasswordMobileBreakpoint) {
              return ForgotPasswordMobileLayout(
                email: _email,
                formKey: _formKey,
              );
            }

            return ForgotPasswordDesktopLayout(
              email: _email,
              formKey: _formKey,
            );
          },
        ),
      ),
    );
  }
}
