
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';


class SecurityNote extends StatelessWidget {
  const SecurityNote({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.sellerBg,                   
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.sellerBorder), 
        ),
        child: const Row(
          children: [
            Icon(
              Icons.lock_outline_rounded,
              size: 14,
              color: AppColors.sellerWhite54,         
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'End-to-end encrypted.\nYour data stays safe.',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.sellerWhite54,      
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      );
}