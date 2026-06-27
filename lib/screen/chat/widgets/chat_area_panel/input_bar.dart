<<<<<<< HEAD

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/recording_wave.dart';
=======
import 'package:choice_x_seller/core/constants/app_colors.dart';
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/audio_preview_bar.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/mic_button.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/send_button.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class InputBar extends StatelessWidget {
<<<<<<< HEAD
  const InputBar({super.key, required this.ctrl, required this.isMobile});
=======
  const InputBar(
      {super.key, required this.ctrl, required this.isMobile});
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7

  final ChatController ctrl;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMobile ? null : const EdgeInsets.fromLTRB(0, 8, 10, 0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
<<<<<<< HEAD
        color: AppColors.sellerSurface,
        borderRadius: isMobile
            ? null
            : const BorderRadius.vertical(bottom: Radius.circular(16)),
        border: Border(
          top: BorderSide(
              color: AppColors.sellerBorder.withValues(alpha: 0.5), width: 1),
=======
        color: AppColors.sellerSurface,                       
        borderRadius: isMobile
            ? null
            : const BorderRadius.vertical(
                bottom: Radius.circular(16)),
        border: Border(
          top: BorderSide(
              color: AppColors.sellerBorder.withValues(alpha: 0.5),
              width: 1),
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
        ),
      ),
      child: GetBuilder<ChatController>(
        id: 'audioPreview',
        builder: (c) {
          if (c.audioPath != null) return AudioPreviewBar(ctrl: c);

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
<<<<<<< HEAD
              if (!c.isRecording)
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: c.toggleEmoji,
                  icon: const Icon(Icons.tag_faces_outlined,
                      size: 22, color: AppColors.textSubdued),
                ),
              const SizedBox(width: 2),
              if (!c.isRecording)
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: c.toggleFileUploadMenu,
                  icon: const Icon(Icons.attach_file,
                      size: 22, color: AppColors.textSubdued),
                ),
              if (!c.isRecording) const SizedBox(width: 8),
              Expanded(
                child: GetBuilder<ChatController>(
                    id: ['audioPreview', 'messageCtrl'],
                    builder: (j) {
                      if (c.isRecording) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.black,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ClipRRect(  borderRadius: BorderRadius.circular(24),
                            child: buildWave(),
                          ),
                        );
                      }
                      return Container(
                        constraints: const BoxConstraints(maxHeight: 120),
                        decoration: BoxDecoration(
                          color: AppColors.sellerSurfaceInput,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: AppColors.sellerBorder),
                        ),
                        child: TextField(
                          controller: c.messageCtrl,
                          style: const TextStyle(
                            color: AppColors.chatTextReceiverAlt,
                            fontSize: 14,
                          ),
                          maxLines: 4,
                          minLines: 1,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: const InputDecoration(
                            hintText: 'Message…',
                            hintStyle: TextStyle(
                                color: AppColors.chatTimestamp, fontSize: 14),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            border: InputBorder.none,
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(width: 8),
              GetBuilder<ChatController>(
                id: 'messageCtrl',
                builder: (ct) => ct.hasMessage
                    ? SendButton(onTap: () => ct.sendMessage(context))
=======
             
              IconButton(                                    
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: c.toggleEmoji,
                icon: const Icon(Icons.tag_faces_outlined,
                    size: 22, color: AppColors.textSubdued),
              ),
              const SizedBox(width: 2),
              IconButton(                                  
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: c.toggleFileUploadMenu,
                icon: const Icon(Icons.attach_file,
                    size: 22, color: AppColors.textSubdued),
              ),
              const SizedBox(width: 8),

              
              Expanded(
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 120),
                  decoration: BoxDecoration(
                    color: AppColors.sellerSurfaceInput,     
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                        color: AppColors.sellerBorder),     
                  ),
                  child: TextField(
                    controller: c.messageCtrl,
                    style: const TextStyle(
                      color: AppColors.chatTextReceiverAlt,   
                      fontSize: 14,
                    ),
                    maxLines: 4,
                    minLines: 1,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      hintText: 'Message…',
                      hintStyle: TextStyle(
                          color: AppColors.chatTimestamp,  
                          fontSize: 14),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

             
              GetBuilder<ChatController>(
                id: 'messageCtrl',
                builder: (ct) => ct.hasMessage
                    ? SendButton(
                        onTap: () => ct.sendMessage(context))
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                    : MicButton(ctrl: ct),
              ),
            ],
          );
        },
      ),
    );
  }
}
