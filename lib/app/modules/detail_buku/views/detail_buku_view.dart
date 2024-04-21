import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/routes/app_pages.dart';
import 'package:nowlib_peminjam/themes.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../../../others/imagememory/image_memory.dart';
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
            child: controller.obx(
              (state) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 180,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: state!.gambar?.isEmpty ?? true
                                  ? Text("No cover")
                                  : Image(image: base64Image(state!.gambar!)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            AutoSizeText(
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
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.confirm,
                                      title: 'Konfirmasi',
                                      titleColor: Colors.blue,
                                      text: 'Mau meminjam buku?',
                                      confirmBtnText: 'Iya',
                                      cancelBtnText: 'Enggak',
                                      confirmBtnColor: Colors.blue,
                                      onConfirmBtnTap: () {
                                        Get.back();
                                        Get.toNamed(Routes.MEMINJAMN,
                                            parameters: {
                                              'id':
                                                  state.bookID.toString() ?? '',
                                              'judul':
                                                  state.judul.toString() ?? '',
                                            });
                                      },
                                    );
                                  },
                                  child: Text(
                                    "Pinjam",
                                    style: regularFont3,
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .blueAccent), // Ubah warna latar belakang
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white), // Ubah warna teks
                                    minimumSize:
                                        MaterialStateProperty.all<Size>(Size(
                                            93.0,
                                            40.0)), // Mengatur tinggi minimum
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                IconButton(
                                  // key: controller.formKey,
                                  onPressed: () {
                                    String? id = Get.parameters['id'];
                                    if (id != null) {
                                      controller.post(int.parse(id));
                                    }
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
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                state.kategoribukurelasi?.first.genre?.namagenre ?? '',
                                style:
                                    regularFont2.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 40,
                            width: 90,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                state.kategoribukurelasi?.first.kategoribuku
                                        ?.namaKategori ??
                                    '',
                                style:
                                    regularFont2.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                      SizedBox(height: 20),
                      //form ulasan
                      Form(
                        key: controller.formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tambah Ulasan:',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              RatingBar.builder(
                                initialRating: controller.userRating.value,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 30,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.greenAccent,
                                ),
                                onRatingUpdate: (rating) {
                                  controller.userRating.value = rating;
                                },
                              ),
                              TextFormField(
                                controller: controller.ulasanController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'beri ulasan buku...',
                                  border: UnderlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.send_rounded),
                                    onPressed: () {
                                      controller.ulasan();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),

                      //ulasan terkirim
                      Text(
                        'Ulasan:',
                        style: regularFont2,
                      ),
                      Container(
                        height: 350,
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.state!.ulasan?.length ?? 0,
                            itemBuilder: (context, index) {
                              var ulasan = controller.state!.ulasan?[index];
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 35,
                                            height: 35,
                                            child: FittedBox(
                                              fit: BoxFit.fill,
                                              child: state.gambar?.isEmpty ?? true
                                                  ? Image.asset("assets/profile/profile.png")
                                                  : Image(image: base64Image(state.gambar!)),
                                            ),
                                            // Image.network(
                                            //   ulasan!.user?.profile ?? "https://www.flaticon.com/free-icons/user"
                                            // ),
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            '${ulasan?.user?.username ?? " "}',
                                            style: regularFont3.copyWith(fontWeight: semiBold),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          ulasan?.ulasan ?? "",
                                          style: regularFont3,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: RatingBar.builder(
                                              initialRating: ulasan?.rating?.toDouble() ?? 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 15,
                                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.greenAccent,
                                              ),
                                              onRatingUpdate: (rating) {
                                                // Do nothing
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 145),
                                            child: Text(
                                              '${ulasan?.tglreview ?? " "}',
                                              style: regularFont4.copyWith(color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
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

//                                           // Get.back();
//                                           // QuickAlert.show(
//                                           //   context: context,
//                                           //   type: QuickAlertType.custom,
//                                           //   barrierDismissible: true,
//                                           //   customAsset: 'assets/giff/bgktg.gif',
//                                           //   confirmBtnText: 'Pinjam',
//                                           //   confirmBtnColor: Colors.blue,
//                                           //   title: 'Isi form untuk meminjam',
//                                           //   widget: Form(
//                                           //     key: controller.formKey,
//                                           //     child: Column(
//                                           //       children: [
//                                           //         TextFormField(
//                                           //           controller: controller.tglKembaliController,
//                                           //           decoration: InputDecoration(
//                                           //             labelText: 'Tanggal Pengembalian',
//                                           //           ),
//                                           //         ),
//                                           //       ],
//                                           //     ),
//                                           //   ),
//                                           //   onConfirmBtnTap: () {
//                                           //     Get.toNamed(Routes.NOTA);
//                                           //     String? id = Get.parameters['id'];
//                                           //     if (id != null) {
//                                           //       controller.pinjam(int.parse(id));
//                                           //     }
//                                           //   }
//                                           // );

// Get.defaultDialog(
//                                       //   title: "Konfirmasi",
//                                       //   middleText: "Mau meminjam buku?",
//                                       //   textConfirm: "Iya",
//                                       //   textCancel: 'enggak',
//                                       //   confirmTextColor: Colors.white,
//                                       //   cancelTextColor: Colors.red,
//                                       //   buttonColor: Colors.blue,
//                                       //   // onCancel: () {
//                                       //   //   Get.back();
//                                       //   // },
//                                       //   onConfirm: () {
//                                       //     Get.back();
//                                       //     Get.toNamed(Routes.MEMINJAMN,
//                                       //       parameters: {
//                                       //         'id': state.bookID.toString(),
//                                       //         'judul': state.judul.toString(),
//                                       //       },
//                                       //     );
//                                       //   }
//                                       // );
