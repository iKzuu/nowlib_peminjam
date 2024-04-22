import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';
import '../../../others/imagememory/image_memory.dart';
import '../controllers/meminjamn_controller.dart';

class MeminjamnView extends GetView<MeminjamnController> {
  const MeminjamnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
          'Meminjaman Buku ${Get.parameters['judul'].toString()}',
          style: regularFont3,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 30.0),

              Container(
                  width: 350.0,
                  height: 450.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 123, 123, 123),
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(30.0)
                  ),

                  child: controller.obx((state) =>
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 40,top: 38,),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 150,
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: state?.gambar?.isEmpty ?? true
                                              ? Text("No cover")
                                              : Image(image: base64Image(state!.gambar!)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 20),

                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 35),
                                      AutoSizeText(
                                        state?.judul ?? '',
                                        style: regularFont3,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        state?.penulis ?? '',
                                        style: regularFont4,
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        state?.penerbit ?? '',
                                        style: regularFont4,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 52),

                            Form(
                              key: controller.formKey,
                              child:
                              Column(
                                children: [
                                  const SizedBox(height: 60.0),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(maxWidth: 250.0),
                                    child: TextFormField(
                                      controller: controller.tglKembaliController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.transparent,
                                        labelText: 'Tanggal Pengembalian',
                                        labelStyle: regularFont3,
                                        prefixIcon: Icon(Icons.calendar_month),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20.0),
                                            borderSide: BorderSide(color: Colors.black)
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                                      ),
                                    ),
                                  ),
                                  
                                  const SizedBox(height: 60.0),
                                  
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
                            ),
                          ],
                        ),
                      )
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
