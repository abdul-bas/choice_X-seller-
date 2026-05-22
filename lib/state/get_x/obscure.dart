import 'package:get/get.dart';

class Obscure extends GetxController {
  RxBool password = false.obs;
  RxBool conformPassword = false.obs;
  void passwordValueChang() {
    password.value = !password.value;
  }

  void passwordConformValueChang() {
    conformPassword.value = !conformPassword.value;
  }
}
