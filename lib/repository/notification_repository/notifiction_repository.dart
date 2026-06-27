import 'package:choice_x_seller/models/notification_model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> updateNotification(
      NotificationModel notification, String userId) async {
    try {
      final docRef = firestore.collection('notifications').doc(userId);

      final docSnapshot = await docRef.get();

      Map<String, dynamic> userNotifications = {};

      if (docSnapshot.exists) {
        userNotifications = Map<String, dynamic>.from(docSnapshot.data() ?? {});
      }

      final String notificationId =
          DateTime.now().millisecondsSinceEpoch.toString();

      userNotifications[notificationId] = notification.toMap();

      await docRef.set(userNotifications);
    } catch (e) {
      print(
          '...........................$e....................................');
    }
  }
}
