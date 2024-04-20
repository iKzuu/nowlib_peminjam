import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_koleksi.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_collection.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class KoleksiController extends GetxController with StateMixin<List<DataCollection>>{

  final loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> refreshData() async {
    change(null, status: RxStatus.loading());
    await getData();
  }

  delete(int? koleksiID) async {
    loading(true);
    try {
      final response = await ApiProvider.instance().delete('${Endpoint.deletekol}?id=$koleksiID');
      if (response.statusCode == 200) {
        Get.snackbar("Selamat", "Berhasil menghapus koleksi", backgroundColor: Colors.greenAccent);
      } else {
        Get.snackbar("Sorry", "Gagal menghapus koleksi", backgroundColor: Colors.orange);
      }
    } on DioException catch (e) {
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

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance()
          .get("${Endpoint.getkol}/?userId=${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 201) { // Change status code to 200
        final ResponseCollection responseCollection =
        ResponseCollection.fromJson(response.data);
        if (responseCollection.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseCollection.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("${response.data['message']}"));
      }
    } on dio.DioError catch (e) { // Change to DioError
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
