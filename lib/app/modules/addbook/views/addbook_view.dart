import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/addbook_controller.dart';

class AddbookView extends GetView<AddbookController> {
  const AddbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: controller.judulController,
                  decoration: InputDecoration(labelText: 'Judul'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.penulisController,
                  decoration: InputDecoration(labelText: 'Penulis'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Penulis is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.penerbitController,
                  decoration: InputDecoration(labelText: 'Penerbit'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Penerbit is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.tahunTerbitController,
                  decoration: InputDecoration(labelText: 'Tahun Terbit'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tahun Terbit is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.jumlahhlmnController,
                  decoration: InputDecoration(labelText: 'Jumlah Halaman'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jumlah Halaman is required';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    print('Button Pressed');
                    final picker = ImagePicker();
                    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      print('Image Path: ${pickedFile.path}');
                      controller.gambarController.text = pickedFile.path!;
                    }
                  },
                  child: Text('Pilih Gambar'),
                ),

                TextFormField(
                  controller: controller.deskripsiController,
                  decoration: InputDecoration(labelText: 'Deskripsi'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.post();
                  },
                  child: Text('Tambahkan Buku'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
