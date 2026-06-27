import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/helpers/time_formatter.dart';
import 'package:choice_x_seller/models/chat_model/chat_model.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({super.key, required this.user, required this.chat,required this.isSelected});

  final UserModel user;
  final ChatModel chat;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.only(bottom: 2),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.sellerAccent.withValues(alpha: 0.08)
            : AppColors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border(
                left: BorderSide(
                  color: AppColors.sellerAccent,
                  width: 3,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: isSelected
                    ? AppColors.sellerAccent.withValues(alpha: 0.3)
                    : AppColors.chatBubbleReceiver,
                child: Text(
                  user.name.isNotEmpty ? user.name[0].toUpperCase() : '?',
                  style: const TextStyle(
                    color: AppColors.chatTextReceiverAlt,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
              Positioned(
                bottom: 1,
                right: 1,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.sellerBg, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
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
                          fontWeight: chat.sellerUnreadCount > 0
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: AppColors.chatTextReceiverAlt,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                   
                      Text(
                        fmtTime(chat.lastMessageTime),
                        style: TextStyle(
                          fontSize: 10,
                          color: chat.sellerUnreadCount > 0
                              ? AppColors.sellerAccent
                              : AppColors.chatTimestamp,
                          fontWeight: chat.sellerUnreadCount > 0
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
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (chat.sellerUnreadCount > 0)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 3),
                        decoration: BoxDecoration(
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
}
