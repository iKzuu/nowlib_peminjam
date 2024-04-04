import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addbook_controller.dart';

class AddbookView extends GetView<AddbookController> {
  const AddbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddbookView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddbookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
