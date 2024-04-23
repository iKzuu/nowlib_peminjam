import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nowlib_peminjam/themes.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../others/imagememory/image_memory.dart';
import '../../../routes/app_pages.dart';
import '../controllers/addbook_controller.dart';

class AddbookView extends GetView<AddbookController> {
  const AddbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          'Add Book',
          style: regularFont,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1.0,
                  padding: EdgeInsets.all(20.0),
                  child: GetBuilder<AddbookController>(
                    init: AddbookController(),
                    builder: (controller) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Tambah Buku', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        InkWell(
                          onTap: () {
                            controller.getImage();
                          },
                          child: Obx(
                                () => controller.imagePath.value == ''
                                ? Container(
                              width: 80,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26, width: 1),
                              ),
                              child: Text(
                                "Cover",
                                style: TextStyle(fontSize: 12),
                              ),
                            ) : Container(
                              width: 100,
                              height: 150,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black26, width: 1),
                              ),
                              child: Image.file(File(controller.imagePath.value)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Input fields for book details
                        TextField(
                          controller: controller.judulController,
                          decoration: InputDecoration(labelText: 'Judul Buku'),
                        ),
                        TextField(
                          controller: controller.penulisController,
                          decoration: InputDecoration(labelText: 'Penulis'),
                        ),
                        TextField(
                          controller: controller.penerbitController,
                          decoration: InputDecoration(labelText: 'Penerbit'),
                        ),
                        TextField(
                          controller: controller.tahunTerbitController,
                          decoration: InputDecoration(labelText: 'Tahun Terbit'),
                        ),
                        TextField(
                          controller: controller.jumlahhlmnController,
                          decoration: InputDecoration(labelText: 'Jumlah Halaman'),
                        ),
                        TextField(
                          controller: controller.deskripsiController,
                          decoration: InputDecoration(labelText: 'Deskripsi Buku'),
                        ),
                        TextField(
                          controller: controller.kategoriController,
                          decoration: InputDecoration(labelText: 'Kategori Buku'),
                        ),
                        TextField(
                          controller: controller.genreController,
                          decoration: InputDecoration(labelText: 'Genre Buku'),
                        ),
                        // Button to create book
                        ElevatedButton(
                          onPressed: () async {
                            controller.loading();
                            await controller.createBook();
                            Get.back();// Close the bottom sheet
                          },
                          child: Text('Tambah Buku'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),

      body:
      SingleChildScrollView(
        child: controller.obx((state) => ListView.separated(
          shrinkWrap: true, // Agar ListView hanya memakan ruang yang diperlukan
          physics: NeverScrollableScrollPhysics(), // Agar ListView tidak bisa di-scroll
          itemCount: state!.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.DETAIL_BUKU,
                    parameters: {
                      'id': state[index].buku?.bookID.toString() ?? '',
                      'judul': state[index].buku?.judul ?? ' ',
                    }
                );
              },
              child: Card(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Color(0xFF373737),
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Container(
                        width: 100,
                        height: 150,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: state[index].buku?.gambar == null
                              ? Text("No cover")
                              : Image(image: base64Image(state[index].buku!.gambar!)),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "${state[index].buku?.judul}",
                              style: regularFont.copyWith(color: Colors.white),
                            ),
                            Text(
                              "Pengarang  : ${state[index].buku?.penulis}",
                              style: regularFont3.copyWith(color: Colors.white),
                            ),
                            Text(
                              "Penerbit   : ${state[index].buku?.penerbit}",
                              style: regularFont3.copyWith(color: Colors.white),
                            ),
                            SizedBox(height: 40),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                
                                  },
                                    color: Colors.white,
                                    icon: Icon(Icons.edit),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.delete(state[index].buku?.bookID).then((value) {
                                        if (value) {
                                          controller.getData();
                                        }
                                      });
                                    },
                                    child: Text(
                                      'hapus',
                                      style: regularFont4,
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Ubah warna latar belakang
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                                      minimumSize: MaterialStateProperty.all<Size>(Size(50.0, 40.0)), // Mengatur tinggi minimum
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        )),
      ),
    );
  }
}
