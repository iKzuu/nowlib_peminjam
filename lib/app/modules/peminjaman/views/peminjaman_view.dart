import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Riwayat Peminjaman'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
        body: SingleChildScrollView(
          child: controller.obx((state) => ListView.separated(
            shrinkWrap: true, // Agar ListView hanya memakan ruang yang diperlukan
            physics: NeverScrollableScrollPhysics(), // Agar ListView tidak bisa di-scroll
            itemCount: state!.length,
            itemBuilder: (context, index){
              return Material(
                child: Container(
                  height: 210,
                  decoration: BoxDecoration(
                    color: Colors.white38,
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
                        decoration: BoxDecoration(
                          image: state[index].buku?.gambar != null
                              ? DecorationImage(
                            image: NetworkImage(state[index].buku!.gambar!),
                            fit: BoxFit.cover,
                          ) : null,
                        ),
                        child: Center(
                          child: state![index].buku?.gambar == null
                              ? Text('no cover',
                            style: regularFont3,
                          ) : null,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 25),
                            Text(
                              "${state[index].buku?.judul}",
                              style: regularFont,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Penulis  : ${state[index].buku?.penulis}",
                              style: regularFont3,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Penerbit   : ${state[index].buku?.penerbit}",
                              style: regularFont3,
                            ),
                            SizedBox(height: 10),
                            Flexible(
                              child: AutoSizeText(
                                "tanggal kembali   : ${state[index].tglPengembalian}",
                                style: regularFont3,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Status   : ${state[index].status}",
                              style: regularFont3.copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
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
