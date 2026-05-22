import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget variantInputField({
  required String label,
  required String hint,
  required IconData icon,
  required TextEditingController ctrl,
  Color accentColor = AppColors.white,
  TextInputType type = TextInputType.text,
  String? Function(String?)? validator,
}) =>
    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label,
          style: const TextStyle(
            fontSize:      9.5,
            fontWeight:    FontWeight.w800,
            color:         AppColors.variantLabelMuted,
            letterSpacing: 1.5,
          )),
      const SizedBox(height: 6),
      TextFormField(
        controller:   ctrl,
        keyboardType: type,
        validator:    validator,
        style: const TextStyle(
          fontSize: 13.5,
          color:    AppColors.variantHeadingText,
        ),
        decoration: InputDecoration(
          hintText:  hint,
          hintStyle: const TextStyle(
            fontSize: 12.5,
            color:    AppColors.variantLabelDeep,
          ),
          prefixIcon: Icon(icon, size: 17, color: AppColors.variantLabelDeep),
          filled:         true,
          fillColor:      AppColors.variantSurfaceMid,
          isDense:        true,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide:   const BorderSide(color: AppColors.variantBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide:   const BorderSide(color: AppColors.variantBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide:   BorderSide(color: accentColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide:   const BorderSide(color: AppColors.danger),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide:   const BorderSide(color: AppColors.danger, width: 1.5),
          ),
          errorStyle: const TextStyle(fontSize: 9.5, color: AppColors.danger),
        ),
      ),
    ]);