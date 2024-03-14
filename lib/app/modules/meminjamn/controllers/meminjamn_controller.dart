import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class MeminjamnController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tglPinjamController = TextEditingController();
  final TextEditingController tglKembaliController = TextEditingController();
  // DateTime? selectedDate;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
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

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
      formKey.currentState?.save();
      if(formKey.currentState!.validate()) {
        final tglPinjam = tglPinjamController.text;
        final tglKembali = tglKembaliController.text;

        final response = await ApiProvider.instance().post(Endpoint.peminjaman,
            data:
            {
              "UserID": int.parse(StorageProvider.read(StorageKey.idUser)),
              "BookID": int.parse(Get.parameters['id'].toString()),
              "TglPeminjaman": tglPinjam,
              "TglPengembalian": tglKembali,
            });
        if (response.statusCode == 201) {
          Get.snackbar("Selamat", "Berhasil meminjam", backgroundColor: Colors.green);
          Get.offAllNamed(Routes.DASHBOARD);
        } else {
          Get.snackbar("Sorry", "Gagal meminjam", backgroundColor: Colors.orange);
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
}
