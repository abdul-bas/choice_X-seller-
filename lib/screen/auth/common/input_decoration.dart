 import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
InputDecoration buildSellerFieldDecoration({
  required String hint,
  required Widget prefix,
  Widget? suffix,
}) =>
    InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: AppColors.white.withValues(alpha: 0.30),
        fontSize: 11,
        fontWeight: FontWeight.normal,
      ),
      prefixIcon: prefix,
      prefixIconColor: AppColors.white,
      suffixIcon: suffix,
      filled: true,
      fillColor: AppColors.transparent,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      errorStyle: const TextStyle(fontSize: 11),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.24)),
        borderRadius: BorderRadius.circular(7),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white, width: 1),
        borderRadius: BorderRadius.circular(7),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.danger.withValues(alpha: 0.41)),
        borderRadius: BorderRadius.circular(7),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.danger),
        borderRadius: BorderRadius.circular(7),
      ),
    );