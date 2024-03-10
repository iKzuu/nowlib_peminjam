import 'package:get/get.dart';

import '../controllers/meminjamn_controller.dart';

class MeminjamnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeminjamnController>(
      () => MeminjamnController(),
    );
  }
}
