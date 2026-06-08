
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptySelectionView extends StatelessWidget {
  const EmptySelectionView({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.chat_outlined,
                size: 40, color: AppColors.chatTimestamp),   
            SizedBox(height: 14),
            Text('Select a conversation',
                style: TextStyle(
                    color: AppColors.textSubdued,          
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            SizedBox(height: 4),
            Text('Choose a chat from the left to get started',
                style: TextStyle(
                    color: AppColors.chatTimestamp,        
                    fontSize: 12)),
          ],
        ),
      );
}
