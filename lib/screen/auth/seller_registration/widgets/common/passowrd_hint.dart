
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordHint extends StatelessWidget {
  const PasswordHint(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.sellerSurface,               
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.sellerBorder), 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.radio_button_unchecked_rounded,
              size: 10,
              color: AppColors.sellerWhite54,          
            ),
            const SizedBox(width: 6),
            Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.sellerWhite54,       
              ),
            ),
          ],
        ),
      );
}