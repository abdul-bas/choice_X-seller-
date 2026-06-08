

import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:fl_chart/fl_chart.dart';

abstract class DashboardLogic {
 
  static const List<String> revenueFilters = [
    'Last 3 Months',
    'Last 6 Months',
    'Last 12 Months',
  ];

  static int monthCountForFilter(String filter) {
    switch (filter) {
      case 'Last 3 Months':  return 3;
      case 'Last 6 Months':  return 6;
      case 'Last 12 Months': return 12;
      default:               return 12;
    }
  }

  static List<FlSpot> filterSpots(List<FlSpot> allSpots, int monthCount) {
    if (allSpots.isEmpty) return [];
    final start = allSpots.length - monthCount;
    return allSpots
        .sublist(start < 0 ? 0 : start)
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.y))
        .toList();
  }

  
  static String statPeriodForFilter(String filter) {
    switch (filter) {
      case 'Today':      return 'today';
      case 'This Week':  return 'week';
      case 'This Month': return 'month';
      default:           return 'month';
    }
  }

  static double getPieValue(String key, SellerOrderController c) {
  final total = c.filteredStatusTotal;
  if (total == 0) return 0;
  switch (key) {
    case 'placed':         return (c.filteredPlaced         / total * 100).clamp(0, 100);
    case 'confirmed':      return (c.filteredConfirmed      / total * 100).clamp(0, 100);
    case 'processing':     return (c.filteredProcessing     / total * 100).clamp(0, 100);
    case 'outForDelivery': return (c.filteredOutForDelivery / total * 100).clamp(0, 100);
    case 'delivered':      return (c.filteredDelivered      / total * 100).clamp(0, 100);
    case 'cancelled':      return (c.filteredCancelled      / total * 100).clamp(0, 100);
    default:               return 0;
  }
}

}