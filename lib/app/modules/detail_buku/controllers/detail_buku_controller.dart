import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/model/response_detail.dart';
import '../../../data/model/response_detailrelasi.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class DetailBukuController extends GetxController with StateMixin<DataBook>{

  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isBookmarked = false;
  final TextEditingController ulasanController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final reviewController = TextEditingController();
  final userRating = 0.0.obs;
  final id = Get.parameters['id'];
  // final rating = 0.0.obs;
  // double lastRating = 0.0;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData(id);
    // getDataDetailBuku(id);
  }

  // void setRating(double newRating) {
  //   if (newRating != lastRating) { // Check if the new rating is different from the last rating
  //     rating.value = newRating;
  //     lastRating = newRating; // Update the last rating
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // pinjam(int id) async {
  //   loading(true);
  //   try {
  //     int? userId = int.tryParse(StorageProvider.read(StorageKey.idUser) ?? "");
  //     FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
  //     formKey.currentState?.save();
  //     if(formKey.currentState!.validate()) {
  //       final tglKembali = tglKembaliController.text;
  //
  //       final response = await ApiProvider.instance().post(Endpoint.peminjaman,
  //           data:
  //           {
  //             "UserID": userId,
  //             "BookID": id,
  //             "TglPengembalian": tglKembali,
  //           });
  //       if (response.statusCode == 201) {
  //         QuickAlert.show(
  //           context: Get.context!,
  //           type: QuickAlertType.success,
  //           confirmBtnText: 'OK',
  //           title: 'Berhasil',
  //           titleColor: Colors.blue,
  //           text: 'Kamu berhasil meminjam buku',
  //         );
  //       } else {
  //         Get.snackbar("Sorry", "Gagal meminjam", backgroundColor: Colors.orange);
  //       }
  //     }
  //
  //   } on DioException catch (e){
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         QuickAlert.show(
  //           context: Get.context!,
  //           type: QuickAlertType.error,
  //           title: 'Gagal',
  //           titleColor: Colors.red,
  //           text: '${e.response?.data['message']}',
  //           confirmBtnText: 'OK',
  //           confirmBtnColor: Colors.red,
  //         );
  //       }
  //     } else {
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     loading(false);
  //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  post(int id) async {
    loading(true);
    try {
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        int? userId = int.tryParse(StorageProvider.read(StorageKey.idUser) ?? "");

        final response = await ApiProvider.instance().post(Endpoint.addkol,
            data:
            {
              "UserID": userId,
              "BookID": id,
            });
        if (response.statusCode == 201) {
          Get.snackbar("Selamat", "Berhasil menambah koleksi", backgroundColor: Colors.blue);
        } else {
          Get.snackbar("Sorry", "Gagal menambah koleksi", backgroundColor: Colors.orange);
        }
      }
    } on DioException catch (e){
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  //==========================================delete koleksi=================================================

  // delete(int id) async {
  //   loading(true);
  //   try {
  //     final response = await ApiProvider.instance().delete('${Endpoint.deletekol}?id=$id');
  //     if (response.statusCode == 200) {
  //       Get.snackbar("Selamat", "Berhasil menghapus koleksi", backgroundColor: Colors.blue);
  //       // Ubah status bookmark menjadi outline
  //       isBookmarked = false;
  //     } else {
  //       Get.snackbar("Sorry", "Gagal menghapus koleksi", backgroundColor: Colors.orange);
  //     }
  //   } on DioException catch (e) {
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
  //       }
  //     } else {
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     loading(false);
  //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  //==========================================get data detail buku=============================================

  Future<void> getData (String? idBuku) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.buku,
          queryParameters: {'id' : idBuku});
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if(responseBook.data == null) {
          change(null, status: RxStatus.empty());
        }else {
          change(responseBook.data, status: RxStatus.success());
        }
      }else{
        change(null, status: RxStatus.error("gagal mengambil data"));
      }

    }on DioException catch (e){
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      }else{
        change(null, status: RxStatus.error(e.message ?? ""));

      }
    }catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  // Future<void> getData () async {
  //   change(null, status: RxStatus.loading());
  //   var idBuku = Get.parameters['id'];
  //   try {
  //     final response = await ApiProvider.instance().get("${Endpoint.buku}?id=$idBuku");
  //     if (response.statusCode == 200) {
  //       final ResponseDetail responseDetail = ResponseDetail.fromJson(response.data);
  //       if(responseDetail.data == null) {
  //         change(null, status: RxStatus.empty());
  //       }else {
  //         change(responseDetail.data, status: RxStatus.success());
  //       }
  //     }else{
  //       change(null, status: RxStatus.error("gagal mengambil data"));
  //     }
  //
  //   }on DioException catch (e){
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null, status: RxStatus.error("${e.response?.data['message']}"));
  //       }
  //     }else{
  //       change(null, status: RxStatus.error(e.message ?? ""));
  //
  //     }
  //   }catch (e) {
  //     change(null, status: RxStatus.error(e.toString()));
  //   }
  // }

  // Future<void> addReview() async {
  //   try {
  //     final review = reviewController.text.trim();
  //     final rating = userRating.value;
  //
  //     // Validasi ulasan dan rating sebelum mengirim
  //     if (review.isEmpty) {
  //       Get.snackbar('Error', 'Ulasan tidak boleh kosong',
  //           snackPosition: SnackPosition.BOTTOM);
  //       return;
  //     }
  //
  //     // Lakukan penanganan untuk mengirim ulasan ke server
  //     // Misalnya, Anda bisa menggunakan API post untuk mengirim ulasan
  //
  //     // Setelah berhasil mengirim ulasan, reset nilai inputan dan rating
  //     reviewController.text = '';
  //     userRating.value = 0.0;
  //
  //     // Beritahu pengguna bahwa ulasan telah berhasil ditambahkan
  //     Get.snackbar('Success', 'Ulasan berhasil ditambahkan',
  //         snackPosition: SnackPosition.BOTTOM);
  //   } catch (e) {
  //     // Tangani kesalahan jika gagal menambah ulasan
  //     Get.snackbar('Error', 'Gagal menambah ulasan: $e',
  //         snackPosition: SnackPosition.BOTTOM);
  //   }
  // }

  ulasan() async{
    loading(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.ulasan,
            data: {
              "UserID": int.parse(StorageProvider.read(StorageKey.idUser)),
              "BookID": Get.parameters['id'],
              "Ulasan": ulasanController.text.toString(),
              "Rating": userRating.value,

            });
        if(response.statusCode == 201){
          final id = Get.parameters['id'];
          getData(id);
          Get.snackbar("Success 👍", "ulasan berhasil", backgroundColor: Colors.green);
          ulasanController.text = "";
          userRating.value = 0;
        } else {
          Get.snackbar("Sorry", "ulasan Gagal",backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch(e){
      loading(false);
      if (e.response!= null){
        if (e.response?.data!= null){
          Get.snackbar("Sorry", "${e.response?.data['message']}",backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "",backgroundColor: Colors.red);
      }
    } catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}

