
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => IconButton(          
        onPressed: onTap,
        padding: EdgeInsets.zero,
        icon: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.white,                        
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_upward_rounded,
              size: 20, color: AppColors.black),             
        ),
      );
}