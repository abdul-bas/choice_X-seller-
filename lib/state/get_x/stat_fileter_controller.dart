import 'package:choice_x_seller/screen/seller_dashboard/controller/trigger_animation.dart';
import 'package:choice_x_seller/state/get_x/arc_progress_controller.dart';
import 'package:choice_x_seller/state/get_x/order_stat_controller.dart';
import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:get/get.dart';


class StatFilterController extends GetxController {
  static const List<String> filters = ['Today', 'This Week', 'This Month'];
  String selected = 'This Month';
void select(String filter) {
  if (selected == filter) return;
  selected = filter;
  update();
  Get.find<SellerOrderController>().fetchTotalOrder().then((_) {
    triggerAnimations(
      Get.find<ArcProgressController>(),
      Get.find<OrderStatusController>(),
    );
  });
}
}