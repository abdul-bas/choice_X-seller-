
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';


class MicButton extends StatelessWidget {
  const MicButton({super.key, required this.ctrl});
  final ChatController ctrl;

  @override
  Widget build(BuildContext context) => IconButton(        
        onPressed: ctrl.handleMicTap,
        padding: EdgeInsets.zero,
        icon: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: ctrl.isRecording
                ? AppColors.danger.withValues(alpha: 0.2)    
                : AppColors.sellerSurfaceInput,             
            shape: BoxShape.circle,
            border: Border.all(
              color: ctrl.isRecording
                  ? AppColors.danger                         
                  : AppColors.sellerBorder,                  
            ),
          ),
          child: Icon(
            ctrl.isRecording ? Icons.stop : Icons.mic_none,
            size: 18,
            color: ctrl.isRecording
                ? AppColors.danger                           
                : AppColors.textSubdued,                     
          ),
        ),
      );
}