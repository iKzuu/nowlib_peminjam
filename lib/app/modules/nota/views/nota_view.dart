import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../routes/app_pages.dart';
import '../controllers/nota_controller.dart';

class NotaView extends GetView<NotaController> {
  const NotaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Nota Peminjaman'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 35),
              Image.asset(
                'assets/nowlib.png',
                width: 225.0,
                height: 225.0,
              ),
              SizedBox(height: 20),
              Container(
                width: 340,
                height: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Judul : ', style: regularFont2),
                          SizedBox(width: 115),
                          // Flexible(
                          //   child: AutoSizeText(
                          //     'ini judul buku yang panjang',
                          //     style: regularFont2,
                          //   ),
                          // ),
                          Flexible(
                            child: AutoSizeText(
                              Get.parameters['Judul'] ?? '',
                              style: regularFont2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Nama Peminjam : ', style: regularFont2,),
                          SizedBox(width: 35),
                          // Flexible(
                          //   child: AutoSizeText(
                          //     'ini nama yang panjang',
                          //     style: regularFont2,
                          //   ),
                          // ),
                          Flexible(
                            child: AutoSizeText(
                              Get.parameters['Namalengkap'] ?? '',
                              style: regularFont2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Tanggal Pinjam : ', style: regularFont2,),
                          SizedBox(width: 42),
                          // Text('2024-03-02', style: regularFont2,),
                          Flexible(
                            child: AutoSizeText(
                              Get.parameters['TglPeminjaman'] ?? '',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text('Tanggal Kembali : ', style: regularFont2,),
                          SizedBox(width: 32),
                          // Text('2024-03-20', style: regularFont2,),
                          Flexible(
                            child: AutoSizeText(
                              Get.parameters['TglPengembalian'] ?? '',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Flexible(
                        child: AutoSizeText(
                          '*tunjukkan invoice pada petugas perpustakaan saat pengambilan buku',
                          style: regularFont4.copyWith(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  title: 'Keluar?',
                  titleColor: Colors.blue,
                  text: 'jangan lupa screenshoot jika belum mengambil buku!',
                  textAlignment: TextAlign.center,
                  confirmBtnText: 'Sudah',
                  cancelBtnText: 'Cancel',
                  onConfirmBtnTap: () {
                    Get.back();
                    Get.toNamed(Routes.DASHBOARD);
                  }
                );
              },
                child: Text(
                  'Kembali',
                  style: regularFont3,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Ubah warna latar belakang
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                  minimumSize: MaterialStateProperty.all<Size>(Size(80.0, 50.0)), // Mengatur tinggi minimum
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
      ),
    );
  }
}
