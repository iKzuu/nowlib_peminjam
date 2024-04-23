import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../themes.dart';
import '../../../others/imagememory/image_memory.dart';
import '../../../routes/app_pages.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Koleksi'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: SingleChildScrollView(
          child: controller.obx((state) => ListView.separated(
            shrinkWrap: true, // Agar ListView hanya memakan ruang yang diperlukan
            physics: NeverScrollableScrollPhysics(), // Agar ListView tidak bisa di-scroll
            itemCount: state!.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.DETAIL_BUKU,
                      parameters: {
                        'id': state[index].bookID.toString(),
                        'judul': state[index].buku?.judul ?? ' ',
                      }
                  );
                },
                child: Container(
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
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "${state[index].buku?.judul}",
                              style: regularFont,
                            ),
                            Text(
                              "Pengarang  : ${state[index].buku?.penulis}",
                              style: regularFont3,
                            ),
                            Text(
                              "Penerbit   : ${state[index].buku?.penerbit}",
                              style: regularFont3,
                            ),
                            SizedBox(height: 40),
                            Container(
                              margin: EdgeInsets.only(right: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.delete(state[index].koleksiID).then((value) {
                                        if (value) {
                                          // Refresh the list after successful deletion
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
                                  )
                                ],
                              ),
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
      ),
    );
  }
}
