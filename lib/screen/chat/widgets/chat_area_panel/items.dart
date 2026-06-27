import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/date_label.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/formate_label.dart';

List<dynamic> buildItems(List<ChatMessageModel> messages) {
  if (messages.isEmpty) return [];
  final items = <dynamic>[];
  DateTime? lastDate;
  items.add(
    "🎉 Good news! A buyer is interested in your product. You're now connected and can chat directly to answer questions, discuss pricing, and finalize the sale. Wishing you a great selling experience!",
  );
  for (int i = messages.length - 1; i >= 0; i--) {
    final msg = messages[i];
    final d = msg.createdAt;
    final msgDate = DateTime(d.year, d.month, d.day);

    if (lastDate == null || msgDate != lastDate) {
      items.add(DateLabel(formatLabel(msgDate)));
      lastDate = msgDate;
    }
    items.add(msg);
  }

  return items;
}
