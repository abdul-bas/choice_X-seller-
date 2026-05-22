
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration inputDec(String hint, IconData? prefixIcon) {
  const r = BorderRadius.all(Radius.circular(10));
  return InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(
        fontSize: 12, color: AppColors.sellerWhite70),
    filled: true,
    fillColor: AppColors.sellerSurface,
    prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, size: 18, color: AppColors.sellerWhite70)
        : null,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    border: const OutlineInputBorder(
        borderRadius: r,
        borderSide: BorderSide(color: AppColors.sellerBorder)),
    enabledBorder: const OutlineInputBorder(
        borderRadius: r,
        borderSide: BorderSide(color: AppColors.sellerBorder)),
    focusedBorder: const OutlineInputBorder(
        borderRadius: r,
        borderSide:
            BorderSide(color: AppColors.sellerWhite60, width: 1.5)),
    errorBorder: const OutlineInputBorder(
        borderRadius: r,
        borderSide: BorderSide(color: AppColors.danger)),
    focusedErrorBorder: const OutlineInputBorder(
        borderRadius: r,
        borderSide: BorderSide(color: AppColors.danger, width: 1.5)),
  );
}