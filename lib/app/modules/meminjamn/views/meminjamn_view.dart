import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../../../routes/app_pages.dart';
import '../controllers/meminjamn_controller.dart';

class MeminjamnView extends GetView<MeminjamnController> {
  const MeminjamnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman Peminjaman',
          style: regularFont,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30.0),
            Container(
                width: 350.0,
                height: 280.0,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 123, 123, 123),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(30.0)
                ),
                child:
                Form(
                  key: controller.formKey,
                  child:
                  Column(
                    children: [
                      const SizedBox(height: 40.0),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 250.0),
                        child: TextFormField(
                          controller: controller.tglPinjamController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Tanggal Peminjaman',
                            labelStyle: regularFont3,
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 15.0),

                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 250.0),
                        child: TextFormField(
                          controller: controller.tglKembaliController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.transparent,
                            labelText: 'Tanggal Pengembalian',
                            labelStyle: regularFont3,
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.black)
                            ),
                            contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      Obx(() => controller.loading.value?
                      CircularProgressIndicator():
                      ElevatedButton(
                        onPressed: () {
                          controller.post();
                        },
                        child: Text("Pinjam"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), // Ubah warna latar belakang
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                          minimumSize: MaterialStateProperty.all<Size>(Size(80.0, 50.0)), // Mengatur tinggi minimum
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
