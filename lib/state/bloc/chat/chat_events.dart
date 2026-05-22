import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';

abstract class ChatEvent {}

class LoadChatMessages extends ChatEvent {
  final String chatId;

  LoadChatMessages(this.chatId);
}

class SendTextMessage extends ChatEvent {
  final ChatMessageModel message;

  SendTextMessage(this.message);
}

class SendImageMessage extends ChatEvent {
  final ChatMessageModel message;

  SendImageMessage(this.message);
}

class ClearChat extends ChatEvent {}

class DeleteMessage extends ChatEvent {
  final String messageId;
  final String chatId;

  DeleteMessage({
    required this.messageId,
    required this.chatId,
  });
}

class ReceiveMessage extends ChatEvent {
  final ChatMessageModel message;

  ReceiveMessage(this.message);
}

class SendProductMessage extends ChatEvent {
  final ChatMessageModel message;
  final String sellerId;
  final String userId;

  SendProductMessage(this.message,this.sellerId,this.userId);
}
class MarkChatAsRead extends ChatEvent {
  final String chatId;
  
  MarkChatAsRead(this.chatId);
}