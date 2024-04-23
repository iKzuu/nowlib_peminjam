import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_detail.dart';
import '../../../data/model/response_peminjaman.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class MeminjamnController extends GetxController with StateMixin<DataDetail>{
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final TextEditingController tglPinjamController = TextEditingController();
  final TextEditingController tglKembaliController = TextEditingController();
  // DateTime? selectedDate;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //     });
  //   }
  // }

  void increment() => count.value++;

  Future<void> getData () async {
    change(null, status: RxStatus.loading());
    var idBuku = Get.parameters['id'];
    try {
      final response = await ApiProvider.instance().get(Endpoint.buku,
        queryParameters: {'id' : idBuku}
      );
      if (response.statusCode == 200) {
        final ResponseDetail responseDetail = ResponseDetail.fromJson(response.data);
        if(responseDetail.data == null) {
          change(null, status: RxStatus.empty());
        }else {
          change(responseDetail.data, status: RxStatus.success());
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

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
      formKey.currentState?.save();
      if(formKey.currentState!.validate()) {
        // final tglPinjam = tglPinjamController.text;
        final tglKembali = tglKembaliController.text;

        final response = await ApiProvider.instance().post(Endpoint.peminjaman,
            data:
            {
              "UserID": int.parse(StorageProvider.read(StorageKey.idUser)),
              "BookID": int.parse(Get.parameters['id'].toString()),
              // "TglPeminjaman": tglPinjam,
              "TglPengembalian": tglKembali,
            });
        if (response.statusCode == 201) {
          String formattedTglPeminjaman = DateFormat('yyyy-MM-dd').format(DateTime.now());
          QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.success,
            confirmBtnText: 'Yey',
            title: 'Selamat!',
            textAlignment: TextAlign.center,
            text: 'Berhasil meminjam buku ${state?.judul.toString()}',
            onConfirmBtnTap: () {
              Get.offAllNamed(Routes.NOTA,
                  parameters: {
                    'Judul': Get.parameters['judul'] ?? '',
                    'Namalengkap' : StorageProvider.read(StorageKey.namalengkap),
                    'TglPeminjaman': formattedTglPeminjaman,
                    'TglPengembalian' : tglKembaliController.text.toString(),
                  }
              );
            }
          );
        } else {
          Get.snackbar("Sorry", "Gagal meminjam", backgroundColor: Colors.orange);
        }
      }
    } on DioException catch (e){
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.error,
            title: 'Gagal',
            titleColor: Colors.red,
            text: '${e.response?.data['message']}',
            confirmBtnText: 'OK',
            confirmBtnColor: Colors.red,
          );
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}
