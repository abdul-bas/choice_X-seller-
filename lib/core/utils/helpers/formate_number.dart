import 'package:intl/intl.dart';

String formatNumber(num number) {
  return NumberFormat.compact().format(number);
}