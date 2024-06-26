import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nowlib_peminjam/app/data/provider/storage_provider.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../routes/app_pages.dart';

class AdminpageController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void logout() async {
    // Clear the stored values
    await StorageProvider.write(StorageKey.status, '');
    await StorageProvider.write(StorageKey.token, '');

    // Navigate to the login page
    Get.offAllNamed(Routes.LOGIN);
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
