import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/audio_preview_bar.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/mic_button.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/send_button.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class InputBar extends StatelessWidget {
  const InputBar({super.key, required this.ctrl, required this.isMobile});

  final ChatController ctrl;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMobile ? null : const EdgeInsets.fromLTRB(0, 8, 10, 0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.sellerSurface,
        borderRadius: isMobile
            ? null
            : const BorderRadius.vertical(bottom: Radius.circular(16)),
        border: Border(
          top: BorderSide(
              color: AppColors.sellerBorder.withValues(alpha: 0.5), width: 1),
        ),
      ),
      child: GetBuilder<ChatController>(
        id: 'audioPreview',
        builder: (c) {
          if (c.audioPath != null) return AudioPreviewBar(ctrl: c);

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                child: GetBuilder<ChatController>(
                    id:['audioPreview', 'messageCtrl'],
                    builder: (controller) {
                      if (controller.isRecording) {
                        return  Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: AppColors.brand.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Flexible(
                              child: AudioWaveforms(
                                enableGesture: false,
                                size: Size(
                                    MediaQuery.of(context).size.width - 10, 45),
                                recorderController: controller.recorderController,
                                waveStyle: const WaveStyle(
                                  waveColor: AppColors.white,
                                  extendWaveform: true,
                                  showMiddleLine: false,
                                  waveThickness: 3,
                                  spacing: 4,
                                ),
                              ),
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
                    : MicButton(ctrl: ct),
              ),
            ],
          );
        },
      ),
    );
  }
}
