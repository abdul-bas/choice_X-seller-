import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DashbordSideview extends GetxController {
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadIndex();
  }

  Future<void> loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    index.value = prefs.getInt('menuIndex') ?? 0;
  }

  Future<void> toggleIndex(int newIndex) async {
    index.value = newIndex;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('menuIndex', newIndex);
  }
}