
import 'package:choice_x_seller/core/constants/app_colors.dart';
import 'package:choice_x_seller/core/utils/firestore_helpers/stream.dart';
import 'package:choice_x_seller/models/chat_model/chat_model.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/repository/chat_repository/chat_repository.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_list_panel/chat_tile.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_list_panel/empty_chat_view.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_list_panel/tile_shimmer.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_bloc.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_events.dart';
import 'package:choice_x_seller/state/get_x/chat_contoller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChatListPanel extends StatelessWidget {
  ChatListPanel({
    super.key,
    required this.ctrl,
    required this.isMobile,
  });

  final ChatController ctrl;
  final bool isMobile;
  final ChatRepository _chatRepository = ChatRepository();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Container(
          margin: isMobile ? null : const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: isMobile
                ? null
                : const BorderRadius.vertical(top: Radius.circular(16)),
            color: AppColors.sellerSurface,                 
          ),
          child: Column(
            children: [
              Row(
                children: [
<<<<<<< HEAD
               if(isMobile)   Builder(
=======
                  Builder(
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                    builder: (context) => IconButton(       
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: const Icon(
                        Icons.menu_rounded,
                        size: 25,
                        color: AppColors.sellerAccent,       
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.chatTextReceiverAlt,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.sellerBorder),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Inbox',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textSubdued,        // ← AppColors
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: ctrl.searchCtrl,
                style: const TextStyle(
                    fontSize: 13, color: AppColors.chatTextReceiverAlt), 
                decoration: InputDecoration(
                  hintText: 'Search…',
                  hintStyle: const TextStyle(
                      fontSize: 13, color: AppColors.chatTimestamp),     
                  filled: true,
                  fillColor: AppColors.sellerSurfaceInput,              
                  isDense: true,
                  prefixIcon: const Icon(Icons.search,
                      size: 16, color: AppColors.chatTimestamp),     
                  contentPadding: const EdgeInsets.symmetric(vertical: 11),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.sellerBorder), 
                  ),
                ),
              ),
            ],
          ),
        ),

      
        Expanded(
          child: GetBuilder<ChatController>(
            id: 'chatList',
            builder: (c) => StreamBuilder<
                List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
              stream: _chatRepository.getChats(),
              builder: (context, snapshot) {
                final state = handleSnapshot(snapshot);
                if (state != null) return state;

                final docs = snapshot.data ?? [];
                if (docs.isEmpty) return const EmptyChatsView();

                final q = c.search.toLowerCase();

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8, horizontal: 12),
                  itemCount: docs.length,
<<<<<<< HEAD
                
=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                  separatorBuilder: (_, __) => const SizedBox(height: 2),
                  itemBuilder: (context, i) {
                    final doc = docs[i];
                    final chat = ChatModel.fromMap(doc.data());

                    return FutureBuilder<
                        DocumentSnapshot<Map<String, dynamic>>>(
                      future: ChatRepository().getUser(chat.userId),
                      builder: (context, userSnap) {
                        if (userSnap.connectionState ==
                            ConnectionState.waiting) {
                          return const TileShimmer();
                        }
                        if (!userSnap.hasData ||
                            userSnap.data?.data() == null) {
                          return const SizedBox.shrink();
                        }

                        final user =
                            UserModel.fromMap(userSnap.data!.data()!);

                        if (q.isNotEmpty &&
                            !user.name.toLowerCase().contains(q) &&
                            !chat.lastMessage.toLowerCase().contains(q)) {
                          return const SizedBox.shrink();
                        }

                        return GetBuilder<ChatController>(
                          id: 'chatArea',
                          builder: (ct) => VisibilityDetector(
                            key: Key(doc.id),
                            onVisibilityChanged: (info) {
                              if (info.visibleFraction > 0.6 &&
                                  chat.sellerUnreadCount > 0 &&
                                  ct.currentChatId == doc.id) {
                                context
                                    .read<ChatBloc>()
                                    .add(MarkChatAsRead(doc.id));
                              }
                            },
                            child: InkWell(                  
                              onTap: () {
                                ct.selectChat(doc.id, user, chat);
                                if (chat.sellerUnreadCount > 0) {
                                  context
                                      .read<ChatBloc>()
                                      .add(MarkChatAsRead(doc.id));
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
<<<<<<< HEAD
                              child: ChatTile(isSelected:  ct.currentChatId == doc.id,
                                chat: chat,user: user,
=======
                              child: ChatTile(
                                chatId: doc.id,
                                user: user,
                                lastMsg: chat.lastMessage,
                                lastTime: chat.lastMessageTime,
                                unread: chat.sellerUnreadCount,
                                isSelected: ct.currentChatId == doc.id,
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}