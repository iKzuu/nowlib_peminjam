import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }



  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
