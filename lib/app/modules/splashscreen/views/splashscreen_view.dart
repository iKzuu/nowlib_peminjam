import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/login/views/login_view.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 2), () {
      // Redirect ke halaman utama menggunakan Get.offAll()
      Get.offAll(LoginView());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashscreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SplashscreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
