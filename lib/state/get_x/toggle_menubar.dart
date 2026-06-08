import 'package:get/get.dart';


class DashbordSideview extends GetxController {
   RxInt index=0.obs;
  toggleIndex(int newIndex) {
    index.value = newIndex;
    
  }
}