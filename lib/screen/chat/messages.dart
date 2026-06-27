<<<<<<< HEAD
=======

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/chat_area_panel.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_list_panel/chat_list_panel.dart';
import 'package:choice_x_seller/screen/chat/widgets/empty_selection_view/empty_selection_view.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ChatController());

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

<<<<<<< HEAD
        return Container(
          margin: isMobile ? null : const EdgeInsets.fromLTRB(10, 10, 10, 10),
          padding: isMobile ? null : const EdgeInsets.all(15),
          decoration: isMobile
              ? null
              : BoxDecoration(
                  color: AppColors.sellerSurface,
                  borderRadius: BorderRadius.circular(16),
                ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.sellerSurfaceDeep,
              borderRadius: BorderRadius.circular(16),
            ),
=======
        return Container(margin: isMobile
                              ? null
                              : const EdgeInsets.fromLTRB(10, 10, 10, 10),
                          padding:
                              isMobile ? null : const EdgeInsets.all(15),
                          decoration: isMobile
                              ? null
                              : BoxDecoration(
                                  color: AppColors.sellerSurface,
                                  borderRadius: BorderRadius.circular(16),
                                ),
          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.sellerSurfaceDeep,
                              borderRadius: BorderRadius.circular(16),
                            ),
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
            child: SafeArea(
              child: isMobile
                  ? GetBuilder<ChatController>(
                      id: 'chatArea',
                      builder: (c) {
                        if (c.currentChatId == null || c.currentUser == null) {
                          return ChatListPanel(ctrl: ctrl, isMobile: isMobile);
                        }
                        return ChatAreaPanel(ctrl: c, isMobile: isMobile);
                      },
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 350,
                          child: ChatListPanel(ctrl: ctrl, isMobile: isMobile),
                        ),
                        Expanded(
                          child: GetBuilder<ChatController>(
                            id: 'chatArea',
                            builder: (c) {
<<<<<<< HEAD
                              if (c.currentChatId == null ||
                                  c.currentUser == null) {
=======
                              if (c.currentChatId == null || c.currentUser == null) {
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                                return const EmptySelectionView();
                              }
                              return ChatAreaPanel(ctrl: c, isMobile: isMobile);
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        );
      },
    );
  }
}
