import 'package:get/get.dart';

class AuthPageSwitcher extends GetxController {
  RxList<bool> isSelected = [false, true].obs;

  void toggleIndex(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
      
    }
  }
}
