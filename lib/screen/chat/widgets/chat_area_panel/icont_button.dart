
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MessageIconBtn extends StatelessWidget {
  const MessageIconBtn(
      {super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => IconButton(        
        onPressed: onTap,
        padding: EdgeInsets.zero,
        iconSize: 20,
        constraints:
            const BoxConstraints(minWidth: 36, minHeight: 36),
        icon: Icon(icon,
            size: 20,
            color: AppColors.textSubdued),                
      );
}
