import 'package:get/get.dart';

import '../controllers/data_peminjaman_controller.dart';

class DataPeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataPeminjamanController>(
      () => DataPeminjamanController(),
    );
  }
}
