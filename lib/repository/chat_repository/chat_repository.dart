import 'dart:io';

import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/state/bloc/chat/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  Future<ChatState> sendProductMessage(
      ChatMessageModel message, String sellerId, String userId) async {
    try {
      final chatRef = firestore.collection('chat').doc(message.chatId);

      await chatRef.set({
        'chatId':message.chatId,
        'sellerId': sellerId,
        'userId': userId,
        'lastMessage': message.text,
        'lastMessageTime': FieldValue.serverTimestamp(),
        'userUnreadCount': FieldValue.increment(1),
        
      }, SetOptions(merge: true));

      await chatRef.collection('messages').add({
        ...message.toMap(),
        'timestamp': FieldValue.serverTimestamp(),
        'isSeen': false,
      });

      return ChatSendSuccess();
    } catch (e) {
      return ChatError(e.toString());
    }
  }

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getChats() {
    final sellerId = AuthRepository().sellerId();

    return firestore.collection('chat').snapshots().map((snapshot) {
      return snapshot.docs.where((doc) {
        final chatId = doc.id;
        final parts = chatId.split('_');
        return parts.contains(sellerId);
      }).toList();
    });
  }

  // Stream<QuerySnapshot<Map<String, dynamic>>> getChat(String chatId) {
  //   return firestore
  //       .collection('chat')
  //       .doc(chatId)
  //       .collection('messages')
  //       .orderBy('timestamp', descending: true)
  //       .limit(10)
  //       .snapshots();
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessages(
    String chatId, {
    int limit = 20,
    QueryDocumentSnapshot<Map<String, dynamic>>? lastDocument,
  }) {
    Query<Map<String, dynamic>> query = firestore
        .collection('chat')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true)
        .limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    return query.snapshots();
  }
  
  Stream<QuerySnapshot<Map<String, dynamic>>> getDemo(
    String chatId, ) {
    Query<Map<String, dynamic>> query = firestore
        .collection('chat')
        .doc(chatId)
        .collection('messages')
        .orderBy('createdAt', descending: true);
       

    return query.snapshots();
  }

  Future<ChatState> markAsRead(String chatId) async {
    try {
      await firestore.collection('chat').doc(chatId).update({
        'sellerUnreadCount': 0,
      });

      return ChatMarkedAsRead(chatId);
    } catch (e) {
      return ChatError(e.toString());
    }
  }

  Future<void> deleteChat(String chatId) async {
    await firestore.collection('chat').doc(chatId).delete();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String userId) async {
    return await firestore.collection('user').doc(userId).get();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getSingleProduct(
      String productId) {
    return firestore.collection('product').doc(productId).snapshots();
  }

  Future<String> uploadFile(String path) async {
    final file = File(path);

    final ref = storage
        .ref()
        .child('chat_audio/${DateTime.now().millisecondsSinceEpoch}.m4a');

    await ref.putFile(file);

    return await ref.getDownloadURL();
  }
}
