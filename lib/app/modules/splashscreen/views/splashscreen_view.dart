import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      controller.checkStatus();
    });

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Image.asset(
                    'assets/nowlib.png',
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Image.asset(
              'assets/giff/loading.gif',
              width: 150,
              height: 150,
            ),
          ),
        ],
      ),
    );
  }
}
