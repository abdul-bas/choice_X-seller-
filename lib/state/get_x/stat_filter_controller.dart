import 'dart:ui';

import 'package:choice_x_seller/state/get_x/seller_order_controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
class StatFilterController extends GetxController {
  static const List<String> filters = ['Today', 'This Week', 'This Month'];
  String selected = 'This Month';

 
  final List<VoidCallback> _onFetchCompleteListeners = [];

  void addOnFetchCompleteListener(VoidCallback callback) {
    _onFetchCompleteListeners.add(callback);
  }

  void removeOnFetchCompleteListener(VoidCallback callback) {
    _onFetchCompleteListeners.remove(callback);
  }

  void select(String filter) async {
    if (selected == filter) return;
    selected = filter;
    update();

    await Get.find<SellerOrderController>().fetchTotalOrder();

    
    for (final listener in _onFetchCompleteListeners) {
      listener();
    }
  }
}