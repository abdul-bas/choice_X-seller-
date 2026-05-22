import 'package:choice_x_seller/repository/chat_repository/chat_repository.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_events.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository = ChatRepository();

  ChatBloc() : super(ChatInitial()) {

    on<SendProductMessage>((event, emit) async {
      emit(ChatLoading());

      final result = await chatRepository.sendProductMessage(
        event.message,
        event.sellerId,
        event.userId,
      );

      emit(result);
    });

    
on<MarkChatAsRead>((event, emit) async {
  final result = await chatRepository.markAsRead(event.chatId);
  emit(result);
});
  }
}