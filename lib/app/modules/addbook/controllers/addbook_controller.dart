import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:nowlib_peminjam/app/data/model/response_book.dart';
import 'package:nowlib_peminjam/app/data/model/response_relasi.dart';
import 'package:nowlib_peminjam/app/modules/home/controllers/home_controller.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/image_convert.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class AddbookController extends GetxController with StateMixin<List<DataRelasi>>{

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController jumlahhlmnController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final HomeController homeController = Get.find();

  var imagePath = ''.obs;
  var imageSize = ''.obs;
  String coverPict = 'nocover';

  final loading = false.obs;

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

  delete(int? bookID) async {
    try {
      final response = await ApiProvider.instance().delete(Endpoint.buku,
          queryParameters: {'id' : bookID}
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

  Future<void> getData () async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.relasi);
      if (response.statusCode == 200) {
        final ResponseRelasi responseRelasi = ResponseRelasi.fromJson(response.data);
        if(responseRelasi.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        }else{
          change(responseRelasi.data, status: RxStatus.success());
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
    } else if (kategoriController.text.isEmpty ||
        kategoriController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Kategori buku tidak boleh kosong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return;
    } else if (genreController.text.isEmpty ||
        genreController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "Genre buku tidak boleh kosong",
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
            "NamaKategori": kategoriController.text.toString(),
            "Namagenre": genreController.text.toString(),
          }));

      if (response.statusCode == 201) {
        loading(false);
        getData();
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

  void increment() => count.value++;
}
