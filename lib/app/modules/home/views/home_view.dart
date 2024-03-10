import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../../../data/model/response_buku.dart';
import '../../../data/model/response_relasi.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header(){
      return Container(
        decoration: BoxDecoration(),
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // image: ImageIcon()
              ),
            ),

            SizedBox(width: 8),

            Column(
              children: [
                Text(
                  'Hello',
                  style: regularFont3,
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        child: TextField(
          controller: controller.searchController,
          onChanged: (query) {
            controller.filterData(query);
          },
          decoration: InputDecoration(
            hintText: "Cari buku....",
            hintStyle: regularFont4.copyWith(color: Colors.grey),
            fillColor: Colors.black12,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            suffixIcon: InkWell(
              onTap: () {
                controller.searchController.clear();
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
      );
    }

    Widget book(DataBuku data) {
      return Material(
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.MEMINJAMN, parameters: {
              'id': (data.bookID ?? 0).toString(),
            });
          },
          child: Container(
            height: 150,
            padding: EdgeInsets.all(15),
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
                // Gambar
                Container(
                  width: 80,
                  height: 120,
                  decoration: BoxDecoration(
                    image: data.gambar != null
                        ? DecorationImage(
                      image: NetworkImage(data.gambar!),
                      fit: BoxFit.cover,
                    ) : null,
                  ),
                ),
                SizedBox(width: 16),
                // Judul, Penulis, Penerbit
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.judul ?? '',
                        style: regularFont2,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Penulis   :  ${data.penulis ?? ''}',
                        style: regularFont3,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Penerbit  :  ${data.penerbit ?? ''}',
                        style: regularFont3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 30),
                searchField(),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Kategori',
                    style: regularFont,
                  ),
                ),
                // ListView builder untuk membuat daftar buku
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, index) {
                    if (index < controller.filteredData.length) {
                      return book(controller.filteredData[index]);
                    } else {
                      return SizedBox(); // Atau widget kosong lainnya
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      )),
    );

  }
}

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