import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../themes.dart';
import '../../../routes/app_pages.dart';
import '../controllers/nota_riwayat_controller.dart';

class NotaRiwayatView extends GetView<NotaRiwayatController> {
  const NotaRiwayatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Color(0xFF373737),
        foregroundColor: Colors.white,
        title: const Text('Nota Peminjaman'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: controller.obx((state) =>
              Center(
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
                      height: 400,
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
                                      state?.invoiceID.toString() ?? '',
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
                                      state!.buku?.judul ?? '',
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
                                      state.user?.namalengkap ?? '',
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
                                      state.tglPeminjaman ?? '',
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
                                      state.tglPengembalian ?? '',
                                      style: regularFont2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Keterangan : ', style: regularFont2,),
                                  // Text('2024-03-20', style: regularFont2,),
                                  Flexible(
                                    child: AutoSizeText(
                                      state.status ?? '',
                                      style: regularFont2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
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
                  ],
                ),
              ),
          )
        ),
      ),
    );
  }
}
