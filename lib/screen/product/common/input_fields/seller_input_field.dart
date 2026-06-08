import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/product/common/input_fields/input_dec.dart';
import 'package:flutter/material.dart';

class SellerInputField extends StatelessWidget {
  const SellerInputField({
    super.key,
    required this.controller,
    required this.hint,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final int maxLines;
  final bool obscureText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
        obscureText: obscureText,
        onChanged: onChanged,
        style: const TextStyle(
            fontSize: 13, color: AppColors.sellerHeading),
        decoration: inputDec(hint, prefixIcon),
      );
}