
import 'package:choice_x_seller/repository/auth_repository/repository.dart';
import 'package:choice_x_seller/repository/order/orders_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';

Future<List<FlSpot>> getChartSpots() async {
  List<double> monthly = List.filled(12, 0);

  final orders = await OrdersOprations()
      .firestore
      .collection('orders')
      .get();

  for (var doc in orders.docs) {
    final data = doc.data();
    if(data['sellerId']!=AuthRepository().sellerId())continue;
    final rawDate = data['date'];
    DateTime date;

    if (rawDate is Timestamp) {
      date = rawDate.toDate();
    } else if (rawDate is String) {
      date = DateTime.parse(rawDate);
    } else {
      continue;
    }

    final amount = (data['amount'] as num).toDouble();

    final monthIndex = date.month - 1;
    monthly[monthIndex] += amount;
  }

  final currentMonthIndex = DateTime.now().month - 1;

  return List.generate(12, (index) {
    final shiftedIndex = (currentMonthIndex - 11 + index) % 12;
    return FlSpot(index.toDouble(), monthly[shiftedIndex]);
  });
}