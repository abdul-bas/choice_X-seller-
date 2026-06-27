<<<<<<< HEAD
import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/date_label.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/formate_label.dart';

=======


import 'package:choice_x_seller/models/chat_model/chat_message_model.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/date_label.dart';
import 'package:choice_x_seller/screen/chat/widgets/chat_area_panel/formate_label.dart';
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
List<dynamic> buildItems(List<ChatMessageModel> messages) {
  if (messages.isEmpty) return [];
  final items = <dynamic>[];
  DateTime? lastDate;
<<<<<<< HEAD
  items.add(
    "🎉 Good news! A buyer is interested in your product. You're now connected and can chat directly to answer questions, discuss pricing, and finalize the sale. Wishing you a great selling experience!",
  );
=======

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
  for (int i = messages.length - 1; i >= 0; i--) {
    final msg = messages[i];
    final d = msg.createdAt;
    final msgDate = DateTime(d.year, d.month, d.day);

<<<<<<< HEAD
=======
    items.add(msg);

>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
    if (lastDate == null || msgDate != lastDate) {
      items.add(DateLabel(formatLabel(msgDate)));
      lastDate = msgDate;
    }
<<<<<<< HEAD
    items.add(msg);
  }

  return items;
}
=======
  }

  return items; 
}
>>>>>>> 0b4f421725e444ced3453607b12d3161ed67b9f7
