import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:nowlib_peminjam/app/data/model/response_book.dart';
import 'package:nowlib_peminjam/app/modules/home/controllers/home_controller.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class AddbookController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController jumlahhlmnController = TextEditingController();
  final TextEditingController gambarController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final HomeController homeController = Get.find();

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

  // post() async {
  //   loading(true);
  //   try {
  //     FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
  //     formKey.currentState?.save();
  //     if(formKey.currentState!.validate()) {
  //       final response = await ApiProvider.instance().post(Endpoint.addbook,
  //           data:
  //           {
  //             "Judul": judulController.text.toString(),
  //             "Tahunterbit": tahunTerbitController.text.toString(),
  //             "Penulis": penulisController.text.toString(),
  //             "Jumlahhlmn": int.parse(jumlahhlmnController.text.toString()),
  //             "Penerbit": penerbitController.text.toString(),
  //             "Gambar" : gambarController.text.toString(),
  //             "Deskripsi" : deskripsiController.text.toString(),
  //           });
  //       if (response.statusCode == 201) {
  //         homeController.getData();
  //         Get.back();
  //       }else{
  //         Get.snackbar("Sorry", "Login gagal", backgroundColor: Colors.orange);
  //       }
  //     }loading(false);
  //   }on DioException catch (e){
  //     loading(false);
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
  //       }
  //     }else{
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   }catch (e) {loading(false);
  //   Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   }
  // }

  post() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
      formKey.currentState?.save();
      if(formKey.currentState!.validate()) {
        // Read the image file as bytes and encode it to base64
        final bytes = await File(gambarController.text).readAsBytes();
        final base64Image = 'data:image/${gambarController.text.split('.').last};base64,' + base64Encode(bytes);

        final response = await ApiProvider.instance().post(Endpoint.addbook,
            data:
            {
              "Judul": judulController.text.toString(),
              "Tahunterbit": tahunTerbitController.text.toString(),
              "Penulis": penulisController.text.toString(),
              "Jumlahhlmn": int.parse(jumlahhlmnController.text.toString()),
              "Penerbit": penerbitController.text.toString(),
              "Gambar" : base64Image,
              "Deskripsi" : deskripsiController.text.toString(),
            });
        if (response.statusCode == 201) {
          homeController.getData();
          Get.back();
        } else {
          Get.snackbar("Sorry", "Failed to add book", backgroundColor: Colors.orange);
        }
      }
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    } finally {
      loading(false);
    }
  }


  void increment() => count.value++;
}
