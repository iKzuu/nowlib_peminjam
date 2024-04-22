import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.confirm,
      confirmBtnText: 'Ya',
      cancelBtnText: 'Tidak',
      title: 'Logout?',
      onConfirmBtnTap: () async {
        await StorageProvider.write(StorageKey.status, '');
        await StorageProvider.write(StorageKey.token, '');
        Get.offAllNamed(Routes.LOGIN);
      }
    );
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
