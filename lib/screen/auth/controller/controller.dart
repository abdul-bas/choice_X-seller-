import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/bloc/auth/authBoloc.dart';
import 'package:choice_x_seller/state/bloc/auth/events/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthController {
  static const double kSellerMobileBreakpoint = 600;
  static const double kSellerTabletBreakpoint = 1000;

  static const double kForgotPasswordMobileBreakpoint = 800;

  static String? validateSellerEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validateSellerPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    return null;
  }

  static LinearGradient sellerHeroPanelGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.brandGradient1,
        AppColors.sellerBg,
      ],
    );
  }

  static bool submitSellerSignIn({
    required GlobalKey<FormState> formKey,
    required String email,
    required String password,
    required BuildContext context,
  }) {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    context.read<AuthBloc>().add(
          AuthSellerAccess(
            email: email.trim(),
            password: password.trim(),
          ),
        );

    return true;
  }

  static String? validateForgotPasswordEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static bool submitForgotPassword({
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required BuildContext context,
  }) {
    final text = emailController.text.trim();
    if (formKey.currentState!.validate() && text.isNotEmpty) {
      context.read<AuthBloc>().add(AuthUpdatePassword(email: text));
      emailController.clear();
      return true;
    }
    return false;
  }

  static LinearGradient forgotPanelGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.brandGradient3,
        AppColors.sellerSurfaceDeep,
      ],
    );
  }

  static LinearGradient forgotBrandGradient() {
    return const LinearGradient(
      colors: [
        AppColors.brandGradient1,
        AppColors.brand,
      ],
    );
  }

  static LinearGradient forgotSubmitGradient() {
    return const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        AppColors.brandGradient1,
        AppColors.brand,
        AppColors.brandGradient1,
      ],
      stops: [0.0, 0.5, 1.0],
    );
  }
}
