import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nowlib_peminjam/app/data/model/response_book.dart';
import 'package:nowlib_peminjam/app/modules/home/controllers/home_controller.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/image_convert.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class AddbookController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController jumlahhlmnController = TextEditingController();
  // final TextEditingController gambarController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final HomeController homeController = Get.find();

  var imagePath = ''.obs;
  var imageSize = ''.obs;
  String coverPict = 'nocover';

  final loading = false.obs;

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

  Future<void> getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      imagePath.value = image.path;
      imageSize.value =
      "${((File(imagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
      Fluttertoast.showToast(
          msg: "Profile picture changed successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Cancel profile image selection",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> createBook() async {
    if (judulController.text.isEmpty || judulController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Judul buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else if (tahunTerbitController.text.isEmpty ||
        tahunTerbitController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Sinopsis buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else if (penulisController.text.isEmpty ||
        penulisController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Penulis buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else if (jumlahhlmnController.text.isEmpty ||
        jumlahhlmnController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Penerbit buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else if (penerbitController.text.isEmpty ||
        penerbitController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Tahun terbit buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else if (deskripsiController.text.isEmpty ||
        deskripsiController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Deskripsi buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }
    if (imagePath.value.isNotEmpty ||
        imagePath.value.trim() != "" ||
        imagePath.value != "") {
      coverPict = (await ImageConvert.imageToBase64(imagePath.value))!;
    } else {
      Fluttertoast.showToast(
          msg: "Cover terbit buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    }

    try {
      loading(true);
      final response = await ApiProvider.instance().post(Endpoint.addbook,
          data: ({
            "Judul": judulController.text.toString(),
            "Tahunterbit": deskripsiController.text.toString(),
            "Penulis": penulisController.text.toString(),
            "Jumlahhlmn": int.parse(jumlahhlmnController.text.toString()),
            "Gambar": coverPict,
            "Penerbit": tahunTerbitController.text.toString(),
            "Deskripsi": deskripsiController.text.toString(),
          }));

      if (response.statusCode == 201) {
        loading(false);
        Fluttertoast.showToast(
            msg: "Berhasil menambahkan buku baru!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Get.offAllNamed(Routes.DASHBOARD);
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
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

  // post() async {
  //   loading(true);
  //   try {
  //     FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
  //     formKey.currentState?.save();
  //     if(formKey.currentState!.validate()) {
  //       // Read the image file as bytes and encode it to base64
  //       final bytes = await File(gambarController.text).readAsBytes();
  //       final base64Image = 'data:image/${gambarController.text.split('.').last};base64,' + base64Encode(bytes);
  //
  //       final response = await ApiProvider.instance().post(Endpoint.addbook,
  //           data:
  //           {
  //             "Judul": judulController.text.toString(),
  //             "Tahunterbit": tahunTerbitController.text.toString(),
  //             "Penulis": penulisController.text.toString(),
  //             "Jumlahhlmn": int.parse(jumlahhlmnController.text.toString()),
  //             "Penerbit": penerbitController.text.toString(),
  //             "Gambar" : base64Image,
  //             "Deskripsi" : deskripsiController.text.toString(),
  //           });
  //       if (response.statusCode == 201) {
  //         homeController.getData();
  //         Get.back();
  //       } else {
  //         Get.snackbar("Sorry", "Failed to add book", backgroundColor: Colors.orange);
  //       }
  //     }
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
  //       }
  //     } else {
  //       Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  //   } finally {
  //     loading(false);
  //   }
  // }


  void increment() => count.value++;
}
