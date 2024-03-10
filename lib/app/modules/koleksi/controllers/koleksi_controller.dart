import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class KoleksiController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  // void changePage(int index) {
  //   selectedIndex = index;
  //   update();
  //   switch (index) {
  //     case 0:
  //       Get.offAllNamed(Routes.HOME);
  //       break;
  //     case 1:
  //       Get.offAllNamed(Routes.KOLEKSI);
  //       break;
  //     case 2:
  //       Get.offAllNamed(Routes.PEMINJAMAN);
  //       break;
  //   }
  // }

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
