import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/login/controllers/login_controller.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
      () => SplashscreenController(),
    );
  }
}
