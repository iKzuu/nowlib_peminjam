import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../themes.dart';
import '../../../others/imagememory/image_memory.dart';
import '../../../routes/app_pages.dart';
import '../controllers/data_peminjaman_controller.dart';

class DataPeminjamanView extends GetView<DataPeminjamanController> {
  const DataPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(
          'Data Peminjaman',
          style: regularFont,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: controller.obx((state) => ListView.separated(
          shrinkWrap: true, // Agar ListView hanya memakan ruang yang diperlukan
          physics: NeverScrollableScrollPhysics(), // Agar ListView tidak bisa di-scroll
          itemCount: state!.length,
          itemBuilder: (context, index){
            return Container(
                height: 200,
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
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: state[index].buku?.gambar == null
                            ? Text("No cover")
                            : Image(image: base64Image(state[index].buku!.gambar!)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            "${state[index].buku?.judul}",
                            style: regularFont,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Peminjam  : ${state[index].user?.username}",
                            style: regularFont3,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Tanggal   : ${state[index].tglPeminjaman}",
                            style: regularFont3,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Alamat   : ${state[index].user?.alamat}",
                            style: regularFont3,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Status :",
                                style: regularFont3,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${state[index].status}',
                                style: regularFont3.copyWith(color: Colors.greenAccent),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
