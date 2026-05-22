import 'dart:convert';
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/repository/chat_repository/chat_repository.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/attachment_menu.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/date_label.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/date_separator.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/image_preview.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/items.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/message_bubble.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MessageList extends StatelessWidget {
  const MessageList({super.key, required this.ctrl});
  final ChatController ctrl;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      key: ValueKey(ctrl.chatVersion),
      stream:
          ChatRepository().getMessages(ctrl.currentChatId!, limit: 10),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            ctrl.messages.isEmpty) {
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                  color: AppColors.textSubdued,            
                  strokeWidth: 1.5),
            ),
          );
        }

        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ctrl.onNewSnapshot(snapshot.data!.docs);
          });
        }

        return InkWell(                                    
          onTap: () {
            if (ctrl.isFileUploadVisible) ctrl.toggleFileUploadMenu();
          },
          child: GetBuilder<ChatController>(
            id: 'messageList',
            builder: (c) {
              if (c.messages.isEmpty) {
                return const Center(
                  child: Text('No messages yet',
                      style: TextStyle(
                          color: AppColors.chatTimestamp,    
                          fontSize: 13)),
                );
              }

             
              final rawMessages = c.messages
                  .map((d) => ChatMessageModel.fromMap(d.data()))
                  .toList();
              final items = buildItems(rawMessages);

              return Stack(
                children: [
                  ListView.builder(
                    controller: c.scrollController,
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    itemCount: items.length + 1,
                    itemBuilder: (context, index) {
                     
                      if (index == items.length) {
                        return GetBuilder<ChatController>(
                          id: 'loadMoreIndicator',
                          builder: (ct) {
                            if (ct.hasReachedEnd) {
                              return const SizedBox(height: 16);
                            }
                            if (ct.isLoadingMore) {
                              return const Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 14),
                                child: Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.textSubdued, 
                                      strokeWidth: 1.5,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return const SizedBox(height: 16);
                          },
                        );
                      }

                      final item = items[items.length - 1 - index];

                      
                      if (item is DateLabel) {
                        return SellerDateSeparator(label: item.label);
                      }

                      final originalIndex =
                          c.messages.length - 1 - index;
                      final isSelected = originalIndex == c.currentIndex;
                      final msg = item as ChatMessageModel;

                      return MessageBubble(
                        index: originalIndex,
                        isSelected: isSelected,
                        c: c,
                        message: msg,
                        isSender: msg.senderId == c.sellerId,
                      );
                    },
                  ),

                  GetBuilder<ChatController>(
                    id: 'fileUpload',
                    builder: (c) => c.isFileUploadVisible
                        ? Positioned(
                            bottom: 8,
                            left: 16,
                            child: AttachmentMenu(ctrl: c),
                          )
                        : const SizedBox.shrink(),
                  ),
                  GetBuilder<ChatController>(
                    id: 'uploaded',
                    builder: (c) => c.fileUpload != null
                        ? Positioned(
                            bottom: 8,
                            left: 12,
                            right: 12,
                            child: ImagePreview(
                              bytes: base64Decode(c.fileUpload!),
                              onRemove: c.removeFile,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}