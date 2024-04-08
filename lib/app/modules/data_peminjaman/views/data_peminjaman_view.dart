import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/data_peminjaman_controller.dart';

class DataPeminjamanView extends GetView<DataPeminjamanController> {
  const DataPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DataPeminjamanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DataPeminjamanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
