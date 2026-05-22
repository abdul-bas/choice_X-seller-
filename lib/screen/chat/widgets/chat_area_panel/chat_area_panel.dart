
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/input_bar.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/message_list.dart';

import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:emoji_picker_flutter_forked_for_web/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ChatAreaPanel extends StatelessWidget {
  const ChatAreaPanel(
      {super.key, required this.ctrl, required this.isMobile});

  final ChatController ctrl;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final user = ctrl.currentUser!;

    return Container(
      margin: isMobile ? null : const EdgeInsets.fromLTRB(0, 10, 10, 10),
      decoration: BoxDecoration(
        border: isMobile
            ? null
            : Border.all(color: AppColors.sellerBorder),  
        borderRadius: isMobile
            ? null
            : const BorderRadius.vertical(top: Radius.circular(16),bottom:Radius.circular(16) ),
      ),
      child: Column(
        children: [
    
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: isMobile
                  ? null
                  : const BorderRadius.vertical(top: Radius.circular(16)),
              color: AppColors.sellerSurface,               
            ),
            child: Row(
              children: [
                if (isMobile)
                  IconButton(
                    onPressed: () => ctrl.clearChat(),
                    icon: const Icon(Icons.arrow_back,
                        color: AppColors.white),            
                  ),

              
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.sellerBg,
                      child: Text(
                        user.name.isNotEmpty
                            ? user.name[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          color: AppColors.chatTextReceiverAlt,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: StreamBuilder<bool>(
                        stream: AuthRepository()
                            .listenUserOnlineStatus(user.uid!),
                        builder: (context, snap) {
                          final isOnline = snap.data ?? false;
                          return Container(
                            width: 9,
                            height: 9,
                            decoration: BoxDecoration(
                              color: isOnline
                                  ? AppColors.success     
                                  : AppColors.sellerBorder,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.sellerSurface,
                                  width: 1.5),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: AppColors.chatTextReceiverAlt, 
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    StreamBuilder<bool>(
                      stream: AuthRepository()
                          .listenUserOnlineStatus(user.uid!),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text(
                            'Checking...',
                            style: TextStyle(
                                fontSize: 11,
                                color: AppColors.textMuted), 
                          );
                        }
                        final isOnline = snapshot.data!;
                        return Text(
                          isOnline ? 'Online' : 'Offline',
                          style: TextStyle(
                            fontSize: 11,
                            color: isOnline
                                ? AppColors.success         
                                : AppColors.textMuted,     
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(child: MessageList(ctrl: ctrl)),

        
          GetBuilder<ChatController>(
            id: 'emoji',
            builder: (c) => c.showEmoji
                ? SizedBox(
                    height: 280,
                    child: EmojiPicker(
                      onEmojiSelected: (_, emoji) {
                        c.messageCtrl.text += emoji.emoji;
                      },
                      onBackspacePressed: () {
                        final txt = c.messageCtrl.text;
                        if (txt.isEmpty) return;
                        c.messageCtrl
                          ..text = txt.characters
                              .skipLast(1)
                              .toString()
                          ..selection = TextSelection.collapsed(
                              offset: c.messageCtrl.text.length);
                      },
                      config: Config(
                        columns: 7,
                        emojiSizeMax: 28,
                        bgColor: AppColors.sellerSurfaceInput, 
                        indicatorColor: AppColors.white,      
                        iconColor: AppColors.textSubdued,      
                        iconColorSelected: AppColors.white,   
                        progressIndicatorColor: AppColors.white,
                        backspaceColor: AppColors.white,
                        enableSkinTones: true,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: 'No Recents',
                        noRecentsStyle: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSubdued),     
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          InputBar(ctrl: ctrl, isMobile: isMobile),
        ],
      ),
    );
  }
}
