
import 'package:choice_x_seller/core/constants/monthly_target.dart';
import 'package:choice_x_seller/state/get_x/arc_progress_controller.dart';
import 'package:choice_x_seller/state/get_x/order_stat_controller.dart';
import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
Future<void> triggerAnimations(
  ArcProgressController arcController,
  OrderStatusController statusController,
) async {
  final SellerOrderController orderController =
      Get.find<SellerOrderController>();


  final int total = orderController.allTotalOrders;

  final double earningsTarget = monthlyRevenueTarget > 0
      ? (orderController.totalRevenue / monthlyRevenueTarget * 100).clamp(0.0, 100.0)
      : 0.0;

  final double ordersTarget = monthlyOrdersTarget > 0
      ? (orderController.totalOrder / monthlyOrdersTarget * 100).clamp(0.0, 100.0)
      : 0.0;

  final double pendingTarget = total > 0
      ? (orderController.pendingOrders / total * 100).clamp(0.0, 100.0)
      : 0.0;

  final double completedTarget = total > 0
      ? (orderController.completedOrders / total * 100).clamp(0.0, 100.0)
      : 0.0;

  arcController.startAnimation(key: 'earnings', target: earningsTarget);
  arcController.startAnimation(key: 'orders',   target: ordersTarget);
  arcController.startAnimation(key: 'listings', target: pendingTarget);
  arcController.startAnimation(key: 'messages', target: completedTarget);
}