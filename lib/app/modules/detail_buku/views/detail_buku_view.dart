import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/routes/app_pages.dart';
import 'package:nowlib_peminjam/themes.dart';
import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail buku ${Get.parameters['judul'].toString()}',
          style: regularFont2,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: controller.obx((state) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 180,
                                decoration: BoxDecoration(
                                  image: state!.gambar != null
                                      ? DecorationImage(
                                    image: NetworkImage(state.gambar!),
                                    fit: BoxFit.cover,
                                  ) : null,
                                ),
                                child: Center(
                                  child: state.gambar == null ? Text(
                                    "No Cover",
                                    style: regularFont2,
                                  ) : null,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              state.judul ?? '',
                              style: regularFont,
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.penulis ?? '',
                              style: regularFont2,
                            ),
                            SizedBox(height: 5),
                            Text(
                              state.penerbit ?? '',
                              style: regularFont2,
                            ),
                            SizedBox(height: 52),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.MEMINJAMN,
                                      parameters: {
                                        'id': state.bookID.toString(),
                                        'judul': state.judul.toString(),
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Pinjam",
                                    style: regularFont3,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), // Ubah warna latar belakang
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                                    minimumSize: MaterialStateProperty.all<Size>(Size(93.0, 40.0)), // Mengatur tinggi minimum
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  onPressed: () {
                                    controller.post();
                                  },
                                  icon: Icon(
                                    Icons.bookmark_border_outlined,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     size: 5,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                        SizedBox(height: 5),
                        Text(
                          'Deskripsi',
                          style: regularFont,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          state.deskripsi ?? '',
                          style: regularFont4,
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}