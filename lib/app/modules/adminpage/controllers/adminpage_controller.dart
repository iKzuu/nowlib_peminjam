import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowlib_peminjam/app/data/provider/storage_provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../routes/app_pages.dart';

class AdminpageController extends GetxController {
  //TODO: Implement AdminpageController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        title: 'Logout',
        titleColor: Colors.red,
        text: 'Yakin ingin logout?',
        textColor: Colors.black,
        confirmBtnText: 'Ya',
        cancelBtnText: 'Tidak',
        onConfirmBtnTap: () {
          Get.back();
          GetStorage().remove(StorageKey.token);
          Get.offAllNamed(Routes.LOGIN);
        });
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
