
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration buildSellerFieldDecoration({
  required String hint,
  required Widget prefix,
  Widget? suffix,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: AppColors.white.withValues(alpha: 0.25)),
    prefixIcon: IconTheme(
      data: IconThemeData(color: AppColors.white.withValues(alpha: 0.35)),
      child: prefix,
    ),
    suffixIcon: suffix,
    filled: true,
    fillColor: AppColors.sellerWhite10,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.white.withValues(alpha: 0.08)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.white.withValues(alpha: 0.08)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
          color: AppColors.sellerPasswordIcon.withValues(alpha: 0.60),
          width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.danger),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.danger, width: 1.5),
    ),
    errorStyle: const TextStyle(color: AppColors.danger, fontSize: 12),
  );
}
