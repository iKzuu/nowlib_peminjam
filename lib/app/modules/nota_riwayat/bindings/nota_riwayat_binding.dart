import 'package:get/get.dart';

import '../controllers/nota_riwayat_controller.dart';

class NotaRiwayatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotaRiwayatController>(
      () => NotaRiwayatController(),
    );
  }
}
