import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_buku.dart';
import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookID = Get.parameters['id'] as String?; // Ubah 'id' menjadi 'BookID' sesuai dengan parameters yang dikirim dari HomeView

    final DataBuku? buku = controller.findBukuById(bookID);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        centerTitle: true,
      ),
      body: buku != null
          ? SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tampilkan detail buku
              Text(
                'Judul: ${buku.judul}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Penulis: ${buku.penulis}'),
              SizedBox(height: 5),
              Text('Penerbit: ${buku.penerbit}'),
              SizedBox(height: 20),
              Text('Deskripsi: ${buku.deskripsi}'),
              SizedBox(height: 20),
              // Tambahkan widget lain sesuai dengan detail buku
            ],
          ),
        ),
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}