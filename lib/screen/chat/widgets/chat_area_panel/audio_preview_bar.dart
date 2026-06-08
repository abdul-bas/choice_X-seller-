
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/icont_button.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/send_button.dart';
import 'package:choice_x_seller/state/get_x/audio_preview_controller.dart';

import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AudioPreviewBar extends StatelessWidget {
  AudioPreviewBar({super.key, required this.ctrl});
  final ChatController ctrl;
  final AudioPreviewController audioCtrl = Get.put(AudioPreviewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioPreviewController>(
      builder: (c) {
        return Row(
          children: [
            MessageIconBtn(icon: Icons.delete_outline, onTap: ctrl.discardAudio),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.sellerSurfaceInput,        
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: AppColors.sellerBorder), 
                ),
                child: Row(
                  children: [
                    IconButton(                             
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () async =>
                          await c.togglePlay(ctrl.audioPath),
                      icon: Icon(
                        c.playing ? Icons.pause : Icons.play_arrow,
                        color: AppColors.chatTextReceiverAlt, 
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: AppColors.sellerBorder,     
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: c.playing ? 0.5 : 0,
                          child: Container(
                              color: AppColors.chatTextReceiverAlt), 
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Voice',
                      style: TextStyle(
                          color: AppColors.textSubdued,    
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            SendButton(onTap: () => ctrl.sendMessage(context)),
          ],
        );
      },
    );
  }
}