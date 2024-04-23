import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../../../routes/app_pages.dart';
import '../controllers/adminpage_controller.dart';

class AdminpageView extends GetView<AdminpageController> {
  const AdminpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.greenAccent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ADDBOOK);
                      },
                      child: Container(
                        child: Text(
                          'Tambah Buku',
                          style: regularFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.redAccent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.ADDBOOK);
                      },
                      child: Container(
                        child: Text(
                          'User',
                          style: regularFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.blueAccent,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.DATA_PEMINJAMAN);
                      },
                      child: Container(
                        child: AutoSizeText(
                          'Peminjaman',
                          style: regularFont.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
