import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nowlib_peminjam/app/data/provider/storage_provider.dart';

import '../../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void checkStatus() async {
    // StorageProvider.initialize();
    String status = StorageProvider.read(StorageKey.status);
    String token = StorageProvider.read(StorageKey.token);

    if (status == 'logged') {
      print("Status: $status");
      print("Token: $token");
      if (JwtDecoder.isExpired(token)) {
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } else {
      return Get.offAllNamed(Routes.LOGIN);
    }
  }

  void increment() => count.value++;
}
