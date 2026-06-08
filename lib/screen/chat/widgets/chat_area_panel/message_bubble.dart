
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/bubble_content.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/bubble_tile_painter.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/inline_bubble_timestap.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.c,
    required this.isSelected,
    required this.message,
    required this.isSender,
    required this.index,
  });

  final ChatMessageModel message;
  final bool isSender;
  final int index;
  final ChatController c;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width;
  final double maxBubbleWidth = width * 0.68;
  final double minBubbleWidth = (width * 0.22).clamp(64.0, 140.0);

    return Align(
      alignment:
          isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
           constraints: BoxConstraints(
        maxWidth: maxBubbleWidth,
        minWidth: minBubbleWidth,
      ),
        child: IntrinsicWidth(
          
          child: Container(   margin: EdgeInsets.only(
            top: 3,
            bottom: 3,
            left: isSender ? 60 : 4,
            right: isSender ? 4 : 60,
          ),
            child: CustomPaint(
              painter: BubbleTailPainter(
                isSender: isSender,
                color: isSender
                    ? const Color(0xFF2A1F4A) 
                    : AppColors.chatBubbleReceiverAlt,      
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
                decoration: BoxDecoration(
                  gradient: isSender
                      ? const LinearGradient(
                          colors: [Color(0xFF2D1B5E), Color(0xFF1E1340)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSender ? null : AppColors.chatBubbleReceiverAlt,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(18),
                    topRight: const Radius.circular(18),
                    bottomLeft: Radius.circular(isSender ? 18 : 4),
                    bottomRight: Radius.circular(isSender ? 4 : 18),
                  ),
                  border: isSender
                      ? null
                      : Border.all(
                          color: AppColors.sellerBorder,       
                          width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 350),
                      child: BubbleContent(
                        message: message,
                        isSender: isSender,
                        isSelected: isSelected,
                        c: c,
                        index: index,
                      ),
                    ),
                    const SizedBox(height: 4),
                   
                    Align(
                      alignment: Alignment.topRight,
                      child: InlineBubbleTimestamp(
                        time: message.createdAt,
                        isSender: isSender,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}