import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:get/get.dart';

class OrderStatusFilterController extends GetxController {
  static const List<String> filters = ['Today', 'This Week', 'This Month'];
  String selected = 'This Month';

  void select(String filter) {
    if (selected == filter) return;
    selected = filter;
    update();
   
    Get.find<SellerOrderController>().fetchTotalOrder();
  }
}