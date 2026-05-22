import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';

class AttachmentMenu extends StatelessWidget {
  const AttachmentMenu({super.key, required this.ctrl});
  final ChatController ctrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.sellerSurfaceInput,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.sellerBorder),
        boxShadow: [
          BoxShadow(
            color: AppColors.black54,
            blurRadius: 12,
          ),
        ],
      ),
      child: InkWell(
        onTap: () async {
          ctrl.toggleFileUploadMenu();
          await ctrl.pickFile();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.image_outlined, size: 16, color: AppColors.textSubdued),
            SizedBox(width: 8),
            Text('Upload image',
                style: TextStyle(
                    color: AppColors.chatTextReceiverAlt, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
