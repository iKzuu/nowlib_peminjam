import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 90,
        actions: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: (value) {
                  controller.search(
                      value); // Memanggil fungsi pencarian saat teks berubah
                },
                decoration: InputDecoration(
                  hintText: "Cari buku....",
                  hintStyle: regularFont3.copyWith(color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.search(controller.searchController
                          .text); // Memanggil fungsi pencarian saat tombol pencarian ditekan
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            Container(
              height: 230,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.blue,
                // Warna latar belakang sementara gambar tidak ada
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: CarouselSlider(
                items: [
                  Image.asset(
                    'assets/image/ramadhankareem.jpg',
                    fit: BoxFit.fitWidth,
                    width: 361,
                  ),
                  Image.asset(
                    'assets/giff/bgktg.gif',
                    fit: BoxFit.fitWidth,
                    width: 361,
                  ),
                  Image.asset(
                    'assets/image/kareem.jpg',
                    fit: BoxFit.fitWidth,
                    width: 361,
                  ),
                  // Tambahkan gambar-gambar GIF lainnya di sini
                ],
                options: CarouselOptions(
                  autoPlay: true, // Untuk mengaktifkan otomatis berputar
                  aspectRatio: 16 / 9, // Sesuaikan dengan rasio gambar Anda
                  viewportFraction: 1, // Menampilkan satu gambar per tampilan
                  enlargeCenterPage: true, // Memperbesar gambar yang sedang ditampilkan
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Untuk Anda",
                    style: regularFont,
                  ),
                )
              ],
            ),

            Container(
              height: 240,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.obx((state) =>
                      ListView.builder(
                          itemCount: state?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_BUKU,
                                    parameters: {
                                      'id': state[index].buku?.bookID.toString() ?? '',
                                      'judul': state[index].buku?.judul.toString() ?? '',
                                    }
                                );
                              },
                              child: Container(
                                width: 125,
                                height: 100,
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: state![index].buku?.gambar !=
                                            null
                                            ? DecorationImage(
                                          image: NetworkImage(
                                              state[index].buku?.gambar!),
                                          fit: BoxFit.cover,
                                        ) : null,
                                      ),
                                      child: Center(
                                        child: state[index].buku?.gambar == null
                                            ? Text('No Image',
                                          style: regularFont3,
                                        ) : null,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Flexible(
                                      child: AutoSizeText(
                                        state[index].buku?.judul ?? '',
                                        style: regularFont2.copyWith(
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Semua",
                    style: regularFont,
                  ),
                )
              ],
            ),

            Container(
              height: 240,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: controller.obx((state) =>
                      ListView.builder(
                          itemCount: state?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_BUKU,
                                    parameters: {
                                      'id': state[index].buku?.bookID.toString() ?? '',
                                      'judul': state[index].buku?.judul.toString() ?? '',
                                    }
                                );
                              },
                              child: Container(
                                width: 125,
                                height: 100,
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      width: 100,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        image: state![index].buku?.gambar !=
                                            null
                                            ? DecorationImage(
                                          image: NetworkImage(
                                              state[index].buku?.gambar!),
                                          fit: BoxFit.cover,
                                        ) : null,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: state[index].buku?.gambar == null
                                            ? Text('No Image',
                                          style: regularFont3,
                                        ) : null,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Flexible(
                                      child: AutoSizeText(
                                        state[index].buku?.judul ?? '',
                                        style: regularFont2.copyWith(
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))),
            ),
          ],
        ),
      ),
    );
  }
}

//   Widget bukuBuku() {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         children: [
//           controller.obx((state) =>
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: state?.length,
//                 itemBuilder: (context, index) {
//                   var kategori = state?[index].kategoribuku;
//                   var bukuni = state?[index].buku;
//                   return Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 15),
//                         child: SizedBox(
//                           width: double.infinity,
//                           child: Text(
//                             kategori! as String,
//                             style: regularFont.copyWith(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w700,
//                             ),
//                             textAlign: TextAlign.start,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 15),
//                         child: SizedBox(
//                           height: 260,
//                           child: ListView.builder(
//                             itemBuilder: (context, index) {
//                               return GestureDetector(
//                                 onTap: () {
//                                   Get.toNamed(Routes.DETAIL_BUKU);
//                                   parameters: {
//                                     'id': buku.book
//                                   }
//                                 },
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               )
//           ),
//         ],
//       ),
//     );
//   }

// Widget searchField() {
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 30),
//     child: TextField(
//       controller: controller.searchController,
//       onChanged: (query) {
//         controller.filterData(query);
//       },
//       decoration: InputDecoration(
//         hintText: "Cari buku....",
//         hintStyle: regularFont4.copyWith(color: Colors.grey),
//         fillColor: Colors.black12,
//         filled: true,
//         border: OutlineInputBorder(
//           borderSide: BorderSide.none,
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         suffixIcon: InkWell(
//           onTap: () {
//             controller.searchController.clear();
//           },
//           child: Container(
//             padding: EdgeInsets.all(10),
//             margin: EdgeInsets.symmetric(horizontal: 6),
//             decoration: BoxDecoration(
//               color: Colors.lightBlue,
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//             ),
//             child: Icon(
//               Icons.search_rounded,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget header(){
//   return Container(
//     decoration: BoxDecoration(),
//     margin: EdgeInsets.symmetric(horizontal: 30),
//     child: Row(
//       children: [
//         Container(
//           width: 50,
//           height: 50,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             // image: ImageIcon()
//           ),
//         ),
//
//         SizedBox(width: 8),
//
//         Column(
//           children: [
//             Text(
//               'Hello',
//               style: regularFont3,
//             ),
//           ],
//         )
//       ],
//     ),
//   );
// }

// Widget book(DataBuku data) {
//   return Material(
//     child: InkWell(
//       onTap: () {
//         Get.toNamed(Routes.MEMINJAMN, parameters: {
//           'id': (data.bookID ?? 0).toString(),
//         });
//       },
//       child: Container(
//         height: 150,
//         padding: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: Colors.white38,
//           border: Border.all(
//             color: Colors.transparent,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(12),
//           ),
//         ),
//         child: Row(
//           children: [
//             // Gambar
//             Container(
//               width: 80,
//               height: 120,
//               decoration: BoxDecoration(
//                 image: data.gambar != null
//                     ? DecorationImage(
//                   image: NetworkImage(data.gambar!),
//                   fit: BoxFit.cover,
//                 ) : null,
//               ),
//             ),
//             SizedBox(width: 16),
//             // Judul, Penulis, Penerbit
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     data.judul ?? '',
//                     style: regularFont2,
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Penulis   :  ${data.penulis ?? ''}',
//                     style: regularFont3,
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     'Penerbit  :  ${data.penerbit ?? ''}',
//                     style: regularFont3,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget listBuku(DataRelasi dataRelasi) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Container(
//         height: 160,
//         width: 110,
//         margin: EdgeInsets.only(top: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           image: dataRelasi.buku?.gambar != null
//               ? DecorationImage(
//             image: NetworkImage(dataRelasi.buku?.gambar!),
//             fit: BoxFit.cover,
//           ) : null,
//         ),
//       ),
//       Text(
//           ''),
//     ],
//   );
// }

// controller.obx((state) => ListView.builder(
// itemCount: state!.length,
// itemBuilder: (context, index) {
// return Column(
// crossAxisAlignment: CrossAxisAlignment.start
// ,
// children: [
// Card(
// elevation: 4,
// margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
// child: ListTile(
// contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
// // leading: Icon(Icons.book),
// title: Text(
// "${state[index].judul}",
// style: TextStyle(
// fontSize: 16,
// fontWeight: FontWeight.bold,
// ),
// ),
// subtitle: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("Penulis: ${state[index].penulis}"),
// Text("Penerbit: ${state[index].penerbit}"),
// Text("Deskripsi: ${state[index].deskripsi}"),
// ],
// ),
// leading: state[index].gambar != null
// ? Image.network(
// state[index].gambar!,
// width: 120,
// height: 160,
// fit: BoxFit.cover,
// )
//     : SizedBox.shrink(),
// onTap: () {
// Get.toNamed(Routes.PEMINJAMAN, parameters: {
// 'id': (state[index].bookID ?? 0).toString(),
// 'judul': state[index].judul ?? "-",
// });
// },
// ),
// ),
// Divider(), // Divider between items
// ],
// );
// },
// )),