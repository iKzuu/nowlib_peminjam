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
                width: 200.0,
                height: 200.0,
              ),
              SizedBox(height: 20),
              Container(
                width: 360,
                height: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Card(
                  child: Container(
                    margin: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('InvoiceID : ', style: regularFont2,),
                            Flexible(
                              child: AutoSizeText(
                                Get.parameters['InvoiceID'] ?? '',
                                style: regularFont2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Judul : ', style: regularFont2),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Nama Peminjam : ', style: regularFont2,),
                            Flexible(
                              child: AutoSizeText(
                                Get.parameters['Namalengkap'] ?? '',
                                style: regularFont2,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal Pinjam : ', style: regularFont2,),
                            // Text('2024-03-02', style: regularFont2,),
                            Flexible(
                              child: AutoSizeText(
                                Get.parameters['TglPeminjaman'] ?? '',
                                style: regularFont2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal Kembali : ', style: regularFont2,),
                            // Text('2024-03-20', style: regularFont2,),
                            Flexible(
                              child: AutoSizeText(
                                Get.parameters['TglPengembalian'] ?? '',
                                style: regularFont2,
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
