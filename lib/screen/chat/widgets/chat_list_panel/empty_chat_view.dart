
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyChatsView extends StatelessWidget {
  const EmptyChatsView({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: AppColors.sellerBorder), 
              ),
              child: const Icon(Icons.forum_outlined,
                  color: AppColors.chatTimestamp, size: 24), 
            ),
            const SizedBox(height: 14),
            const Text('No conversations',
                style: TextStyle(
                    color: AppColors.textSubdued,            
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            const Text('Customer messages will appear here',
                style: TextStyle(
                    color: AppColors.chatTimestamp,          
                    fontSize: 11)),
          ],
        ),
      );
}