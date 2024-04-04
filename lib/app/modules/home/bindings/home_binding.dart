import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/splashscreen/controllers/splashscreen_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
