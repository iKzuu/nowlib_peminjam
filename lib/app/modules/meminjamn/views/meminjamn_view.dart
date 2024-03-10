import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/meminjamn_controller.dart';

class MeminjamnView extends GetView<MeminjamnController> {
  const MeminjamnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeminjamnView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.tglPinjamController,
                  decoration: InputDecoration(hintText: "Tanggal Pinjam"),
                  validator: (value) {
                    if (value!.length <2) {
                      return "Tanggal Pinjam tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.tglKembaliController,
                  decoration: InputDecoration(hintText: "Tanggal kembali"),
                  validator: (value) {
                    if (value!.length <2) {
                      return "Tanggal Kembali tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                Obx(() => controller.loading.value?
                CircularProgressIndicator():
                ElevatedButton(onPressed: () {
                  controller.post();
                }, child: Text("Pinjam"))
                )
              ],
            ),
          )
      ),
    );
  }
}
