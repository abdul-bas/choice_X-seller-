import 'package:choice_x_seller/repository/chat_repository/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageListController extends GetxController {
  bool initialised = false;
  bool isLoadingMore = false;
  bool hasReachedEnd = false;
  String? currentChatId;
  int? currentIndex;
  static const int _pageSize = 8;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> messages = [];
  final ScrollController scrollController = ScrollController();
  void onInitialMessages(
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs,
    String? chatId,
  ) {
    messages
      ..clear()
      ..addAll(docs);

    initialised = true;
    currentChatId = chatId;

    hasReachedEnd = false;
    isLoadingMore = false;

    update();
  }

  setCurrentIndex(int index) {
    currentIndex = index;
    update(['messageList']);
  }

  Future<void> fetchMoreMessages() async {
    if (isLoadingMore || hasReachedEnd || currentChatId == null) return;
    if (messages.isEmpty) return;

    isLoadingMore = true;
    update(['loadMoreIndicator']);

    final snapshot = await ChatRepository()
        .getMessages(
          currentChatId!,
          limit: _pageSize,
          lastDocument: messages.last,
        )
        .first;

    final newDocs = snapshot.docs;

    if (newDocs.isEmpty) {
      hasReachedEnd = true;
    } else {
      messages.addAll(newDocs);
    }

    isLoadingMore = false;
    update(['loadMoreIndicator']);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      fetchMoreMessages();
    }
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_onScroll);
  }
}
