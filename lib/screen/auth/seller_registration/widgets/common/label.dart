
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class SellerRegistationLabel extends StatelessWidget {
  const SellerRegistationLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.sellerWhite54,               
          letterSpacing: 0.15,
        ),
      );
}