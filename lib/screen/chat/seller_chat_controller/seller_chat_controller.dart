
import 'package:choice_x_seller/models/chat_model/chat_model.dart';
import 'package:choice_x_seller/models/user_model/user_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/repository/chat_repository/chat_repository.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_bloc.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellerChatController {
  SellerChatController._();

  

  static Stream<dynamic> getChatsStream() => ChatRepository().getChats();

  static Stream<dynamic> getMessagesStream(String chatId, {int limit = 10}) =>
      ChatRepository().getMessages(chatId, limit: limit);

  static Stream<bool> listenOnlineStatus(String uid) =>
      AuthRepository().listenUserOnlineStatus(uid);

  static Stream<dynamic> getSingleProductStream(String productId) =>
      ChatRepository().getSingleProduct(productId);

  static Future<dynamic> getUser(String userId) =>
      ChatRepository().getUser(userId);


  static ChatModel parseChat(Map<String, dynamic> data) =>
      ChatModel.fromMap(data);

  static UserModel parseUser(Map<String, dynamic> data) =>
      UserModel.fromMap(data);

  

  static void markAsRead(BuildContext context, String chatId) {
    context.read<ChatBloc>().add(MarkChatAsRead(chatId));
  }
}