import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class InlineBubbleTimestamp extends StatelessWidget {
  const InlineBubbleTimestamp(
      {super.key, required this.time, required this.isSender});

  final DateTime time;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    final h = time.hour > 12
        ? time.hour - 12
        : (time.hour == 0 ? 12 : time.hour);
    final m = time.minute.toString().padLeft(2, '0');
    final ampm = time.hour >= 12 ? 'PM' : 'AM';

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$h:$m $ampm',
          style: TextStyle(
            fontSize: 9.5,
            color: isSender
                ? AppColors.white.withValues(alpha: 0.45)
                : AppColors.chatTimestamp,                   
          ),
        ),
        if (isSender) ...[
          const SizedBox(width: 3),
          Icon(
            Icons.done_all_rounded,
            size: 11,
            color: AppColors.white.withValues(alpha: 0.45),
          ),
        ],
      ],
    );
  }
}
