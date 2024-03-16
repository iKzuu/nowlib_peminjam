import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../../../data/model/response_buku.dart';
import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Padding(padding: EdgeInsets.all(8.0),
                  child: controller.obx((state) => ListView.builder(
                      // itemCount: state!.length,
                      itemBuilder: (context, index) {
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 200,
                                width: 250,
                                decoration: BoxDecoration(
                                  image: state![index].gambar != null
                                  ? DecorationImage(
                                      image: NetworkImage(state![index].gambar!)
                                  ): null,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    "${state[index].judul}",
                                    style: regularFont,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${state[index].penulis}",
                                    style: regularFont2,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${state[index].penerbit}",
                                    style: regularFont3,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
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