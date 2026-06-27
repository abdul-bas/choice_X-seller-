<<<<<<< HEAD
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/time_formatter.dart';
import 'package:choice_x_seller/models/chat_model/chat_model.dart';
=======

import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/time_formatter.dart';
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
<<<<<<< HEAD
  const ChatTile({super.key, required this.user, required this.chat,required this.isSelected});

  final UserModel user;
  final ChatModel chat;
  final bool isSelected;
=======
  const ChatTile({
    super.key,
    required this.chatId,
    required this.user,
    required this.lastMsg,
    required this.unread,
    required this.isSelected,
    this.lastTime,
  });

  final String chatId;
  final UserModel user;
  final String lastMsg;
  final int unread;
  final bool isSelected;
  final DateTime? lastTime;

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
<<<<<<< HEAD
            ? AppColors.sellerAccent.withValues(alpha: 0.08)
            : AppColors.transparent,
=======
            ? AppColors.sellerAccent.withValues(alpha: 0.08) 
            : AppColors.transparent,                         
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border(
                left: BorderSide(
<<<<<<< HEAD
                  color: AppColors.sellerAccent,
=======
                  color: AppColors.sellerAccent,              
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                  width: 3,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
<<<<<<< HEAD
=======
          
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
          Stack(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: isSelected
                    ? AppColors.sellerAccent.withValues(alpha: 0.3)
<<<<<<< HEAD
                    : AppColors.chatBubbleReceiver,
                child: Text(
                  user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: AppColors.chatTextReceiverAlt,
=======
                    : AppColors.chatBubbleReceiver,           
                child: Text(
                  user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: AppColors.chatTextReceiverAlt,     
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
<<<<<<< HEAD
=======
          
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
<<<<<<< HEAD
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.sellerBg, width: 2),
=======
                    color: AppColors.success,                
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.sellerBg, width: 2), 
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
<<<<<<< HEAD
=======

        
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 13.5,
<<<<<<< HEAD
                          fontWeight: chat.sellerUnreadCount > 0
=======
                          fontWeight: unread > 0
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: AppColors.chatTextReceiverAlt,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
<<<<<<< HEAD
                   
                      Text(
                        fmtTime(chat.lastMessageTime),
                        style: TextStyle(
                          fontSize: 10,
                          color: chat.sellerUnreadCount > 0
                              ? AppColors.sellerAccent
                              : AppColors.chatTimestamp,
                          fontWeight: chat.sellerUnreadCount > 0
=======
                    if (lastTime != null)
                      Text(
                        fmtTime(lastTime!),
                        style: TextStyle(
                          fontSize: 10,
                          color: unread > 0
                              ? AppColors.sellerAccent       
                              : AppColors.chatTimestamp,    
                          fontWeight: unread > 0
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
<<<<<<< HEAD
                        chat.lastMessage.isEmpty
                            ? 'Unsupported message'
                            : chat.lastMessage,
                        style: TextStyle(
                          fontSize: 12,
                          color: chat.sellerUnreadCount > 0
                              ? AppColors.chatTextReceiverAlt
                                  .withValues(alpha: 0.6)
                              : AppColors.chatTimestamp,
                          fontWeight: chat.sellerUnreadCount > 0
=======
                        lastMsg.isEmpty ? 'No messages yet' : lastMsg,
                        style: TextStyle(
                          fontSize: 12,
                          color: unread > 0
                              ? AppColors.chatTextReceiverAlt 
                                  .withValues(alpha: 0.6)
                              : AppColors.chatTimestamp,     
                          fontWeight: unread > 0
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
<<<<<<< HEAD
                    if (chat.sellerUnreadCount > 0)
=======
                    if (unread > 0)
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
<<<<<<< HEAD
                          color: AppColors.sellerAccent,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          chat.sellerUnreadCount > 99
                              ? '99+'
                              : '$chat.sellerUnreadCount',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,
=======
                          color: AppColors.sellerAccent,      
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: Text(
                          unread > 99 ? '99+' : '$unread',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: AppColors.white,       
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
