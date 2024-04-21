import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_buku.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_relasi.dart';
import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController with StateMixin<List<DataRelasi>> {
  final RxInt count = 0.obs;
  TextEditingController searchController = TextEditingController();
  List<DataRelasi>? bookList;
  final imageBase64 = " ".obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void search(String keyword) {
    if (bookList != null) {
      List<DataRelasi> filteredList = bookList!.where((book) =>
          book.buku!.judul!.toLowerCase().contains(keyword.toLowerCase())).toList();
      change(filteredList, status: RxStatus.success());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }


  Future<void> getData () async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.relasi);
      if (response.statusCode == 200) {
        final ResponseRelasi responseRelasi = ResponseRelasi.fromJson(response.data);
        if(responseRelasi.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        }else{
          bookList = responseRelasi.data;
          change(bookList, status: RxStatus.success());
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
  //   try {
  //     final response = await ApiProvider.instance().get(Endpoint.buku);
  //     if (response.statusCode == 200) {
  //       final ResponseBuku responseBuku = ResponseBuku.fromJson(response.data);
  //       if(responseBuku.data!.isEmpty) {
  //         change(null, status: RxStatus.empty());
  //       }else{
  //         bookList = responseBuku.data;
  //         change(bookList, status: RxStatus.success());
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

  void increment() => count.value++;
}

