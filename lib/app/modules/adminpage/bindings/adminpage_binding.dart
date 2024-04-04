import 'package:get/get.dart';

import '../controllers/adminpage_controller.dart';

class AdminpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminpageController>(
      () => AdminpageController(),
    );
  }
}
