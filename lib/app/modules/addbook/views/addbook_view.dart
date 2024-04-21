import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../controllers/addbook_controller.dart';

class AddbookView extends GetView<AddbookController> {
  const AddbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: GetBuilder<AddbookController>(
          init: AddbookController(), // Initialize the controller
          builder: (controller) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //pick image
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
                      style: regularFont4,
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
              // Display selected image path and size
              if (controller.imagePath.isNotEmpty)
                Text('Image Path: ${controller.imagePath}'),
              if (controller.imageSize.isNotEmpty)
                Text('Image Size: ${controller.imageSize}'),
              // Button to create book
              ElevatedButton(
                onPressed: () async {
                  await controller.createBook();
                },
                child: Text('Create Book'),
              ),
              // Loading indicator
              if (controller.loading.value)
                CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
