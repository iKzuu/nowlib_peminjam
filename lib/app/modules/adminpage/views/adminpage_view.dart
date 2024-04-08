import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/adminpage_controller.dart';

class AdminpageView extends GetView<AdminpageController> {
  const AdminpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminpageView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Text("Profile")
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.ADDBOOK);
              },
              child: Text("Tambah Buku"),
            ),
          ],
        ),
      ),
    );
  }
}
