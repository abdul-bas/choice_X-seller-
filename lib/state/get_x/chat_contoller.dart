import 'dart:convert';
import 'dart:io';
<<<<<<< HEAD
import 'package:audio_waveforms/audio_waveforms.dart';
=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/models/chat_model/chat_model.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/repository/chat_repository/chat_repository.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_bloc.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_events.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

class ChatController extends GetxController {
  final AuthRepository _auth = AuthRepository();
  final AudioRecorder audioRecorder = AudioRecorder();
  int? currentIndex;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchCtrl = TextEditingController();
  final TextEditingController messageCtrl = TextEditingController();
<<<<<<< HEAD
  final RecorderController recorderController = RecorderController();
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> messages = [];
   bool isInitialized = false;
=======

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> messages = [];

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
  String search = '';
  UserModel? currentUser;
  String? currentChatId;
  ChatModel? currentChat;

  int chatVersion = 0;

  bool isRecording = false;
  String? audioPath;
  String? fileUpload;
  bool isFileUploadVisible = false;
  bool hasMessage = false;
  bool showEmoji = false;
  bool isLoadingMore = false;
  bool hasReachedEnd = false;

  static const int _pageSize = 20;

  String get sellerId => _auth.sellerId();

  @override
  void onInit() {
    super.onInit();
    messageCtrl.addListener(_syncSendState);
    searchCtrl.addListener(() {
      final v = searchCtrl.text.trim();
      if (search != v) {
        search = v;
        update(['chatList']);
      }
    });
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      fetchMoreMessages();
    }
  }

  setCurrentIndex(int index) {
    currentIndex = index;
    update(['messageList']);
  }

<<<<<<< HEAD
 

  void initialize() {
    isInitialized = true;
    notifyChildrens();
  }

=======
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
  void _syncSendState() {
    final next =
        messageCtrl.text.isNotEmpty || fileUpload != null || audioPath != null;
    if (hasMessage != next) {
      hasMessage = next;
      update(['messageCtrl']);
    }
  }

  void selectChat(String chatId, UserModel user, ChatModel chat) {
    if (currentChatId == chatId) return;

    currentChatId = chatId;
    currentUser = user;
    currentChat = chat;

    messages.clear();
    hasReachedEnd = false;
    isLoadingMore = false;
    chatVersion++;

    update(['chatArea']);
  }

  void onNewSnapshot(List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    messages
      ..clear()
      ..addAll(docs);
    update(['messageList']);
  }

  Future<void> fetchMoreMessages() async {
    if (isLoadingMore || hasReachedEnd || currentChatId == null) return;
    if (messages.isEmpty) return;

    isLoadingMore = true;
    update(['loadMoreIndicator']);

    try {
      final snap = await ChatRepository()
          .getMessages(
            currentChatId!,
            limit: _pageSize,
            lastDocument: messages.last,
          )
          .first;

      if (snap.docs.isEmpty) {
        hasReachedEnd = true;
      } else {
        messages.addAll(snap.docs);
      }
    } finally {
      isLoadingMore = false;
      update(['messageList', 'loadMoreIndicator']);
    }
  }

  void sendMessage(BuildContext context) {
    if (currentChatId == null || currentUser == null) return;
    final text = messageCtrl.text.trim();
    if (text.isEmpty && fileUpload == null && audioPath == null) return;

    final message = ChatMessageModel(
      isRead: false,
      messageId: const Uuid().v4(),
      chatId: currentChatId!,
      senderId: sellerId,
      receiverId: currentUser!.uid!,
      text: text.isEmpty ? null : text,
      imageUrl: fileUpload,
      audioUrl: audioPath,
      createdAt: DateTime.now(),
    );
    context
        .read<ChatBloc>()
        .add(SendProductMessage(message, sellerId, currentUser!.uid!));
    clearMessage();
  }

  void toggleEmoji() {
    showEmoji = !showEmoji;
    update(['emoji']);
  }

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result == null) return;
    final file = result.files.single;
    final Uint8List bytes;
    if (file.bytes != null) {
      bytes = file.bytes!;
    } else {
      bytes = await File(file.path!).readAsBytes();
    }
    fileUpload = base64Encode(bytes);
    update(['uploaded']);
    _syncSendState();
  }

  void removeFile() {
    fileUpload = null;
    update(['uploaded']);
    _syncSendState();
  }

  Future<void> handleMicTap() async {
    if (isRecording) {
      final path = await audioRecorder.stop();
      isRecording = false;
      if (path != null && path.isNotEmpty) {
        audioPath = path;
        hasMessage = true;
      }
    } else {
      if (!await audioRecorder.hasPermission()) return;
      isRecording = true;
      final path = kIsWeb
          ? 'voice_${DateTime.now().millisecondsSinceEpoch}.m4a'
          : '${(await getTemporaryDirectory()).path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await audioRecorder.start(const RecordConfig(), path: path);
    }
    update(['audioPreview', 'messageCtrl']);
  }

  void discardAudio() {
    audioPath = null;
    isRecording = false;
    hasMessage = messageCtrl.text.isNotEmpty || fileUpload != null;
    update(['audioPreview', 'messageCtrl']);
  }

  void clearMessage() {
    messageCtrl.clear();
    fileUpload = null;
    hasMessage = false;
    audioPath = null;
    update(['uploaded', 'messageCtrl', 'audioPreview']);
  }

  void toggleFileUploadMenu() {
    isFileUploadVisible = !isFileUploadVisible;
    update(['fileUpload']);
  }

  void clearChat() {
    currentChatId = null;
    currentUser = null;
    currentChat = null;

    messages.clear();
    hasReachedEnd = false;
    isLoadingMore = false;

    update(['chatArea', 'messageList']);
  }

  @override
  void onClose() {
    searchCtrl.dispose();
    messageCtrl.dispose();
    audioRecorder.dispose();
    scrollController.dispose();
    super.onClose();
  }
}
