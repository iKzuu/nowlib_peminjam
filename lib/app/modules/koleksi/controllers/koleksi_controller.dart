import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_koleksi.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_collection.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/jwt_convert.dart';
import '../../../data/provider/storage_provider.dart';

class KoleksiController extends GetxController with StateMixin<List<DataCollection>> {
  // final token = StorageProvider.read(StorageKey.token);
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
    try {
      final response = await ApiProvider.instance().delete(Endpoint.deletekol,
          queryParameters: {'id' : koleksiID}
      );
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        title: 'Hapus Buku?',
        confirmBtnText: 'Ya',
        cancelBtnText: 'Tidak',
        onConfirmBtnTap: () {
          Get.back();
          if (response.statusCode == 200) {
            getData();
            QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.success,
              confirmBtnText: 'Ok',
              title: 'Berhasil',
              text: 'Berhasil Menghapus Koleksi',
              titleColor: Colors.green,
            );
          } else {
            QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.error,
              confirmBtnText: 'Ok',
              title: 'Gagal',
              text: 'Gagal Menghapus Koleksi',
              titleColor: Colors.red,
            );
          }
        }
      );
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      // final decodedToken = await JwtConverter.jwtDecode(token);
      // final iduser = decodedToken["id"].toString();
      final response = await ApiProvider.instance().get(Endpoint.getkol,
          queryParameters: {'userId': StorageProvider.read(StorageKey.idUser)});
      if (response.statusCode == 201) {
        final ResponseCollection responseCollection =
            ResponseCollection.fromJson(response.data);
        if (responseCollection.data == null ||
            responseCollection.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseCollection.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      log(e.toString());
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
