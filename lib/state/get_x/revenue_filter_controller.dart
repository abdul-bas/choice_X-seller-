import 'package:choice_x_seller/screen/seller_dashboard/controller/controller.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RevenueFilterController extends GetxController {
  String selected = DashboardLogic.revenueFilters.last;

  int get monthCount =>
      DashboardLogic.monthCountForFilter(selected);

  void select(String filter) {
    if (selected == filter) return;

    selected = filter;
    update();
  }
  
}