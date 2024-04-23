import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nowlib_peminjam/app/data/model/response_user.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/image_convert.dart';
import '../../../data/provider/jwt_convert.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class ProfileController extends GetxController{

  final token = StorageProvider.read(StorageKey.token);
  final loading = false.obs;
  final count = 0.obs;
  final dataUser = Rx<DataUser>(DataUser());

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> changeProfilePicture() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final imagePath = image.path;
      final imageSize =
          ((File(imagePath)).lengthSync() / 1024 / 1024).toStringAsFixed(2);
      final double maxSize = 5.0;
      if (double.parse(imageSize.replaceAll('Mb', '')) > maxSize) {
        Fluttertoast.showToast(
            msg: "Gambar terlalu besar. Ukuran maksimal adalah 10Mb",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        return;
      }

      final base64Image = await ImageConvert.imageToBase64(imagePath);

      if (base64Image != null) {
        try {
          loading(true);
          final response = await ApiProvider.instance().patch(Endpoint.user,
              data: {
                "Profile": base64Image,
              },
            queryParameters: {
            'userId' : StorageProvider.read(StorageKey.idUser),
            },
          );

          if (response.statusCode == 201) {
            loading(false);
            getUserProfile(); // Update user profile after edit
            Fluttertoast.showToast(
              msg: "Foto profil berhasil diubah",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          } else {
            loading(false);
            Fluttertoast.showToast(
              msg: "Gagal mengubah foto profil",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        } catch (e) {
          loading(false);
          log(e.toString());
          Fluttertoast.showToast(
            msg: "Terjadi kesalahan",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: "Gagal mengubah foto profil",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    } else {
      Fluttertoast.showToast(
        msg: "Batal memilih foto profil",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  void logout() {
    QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        confirmBtnText: 'Ya',
        cancelBtnText: 'Tidak',
        title: 'Logout?',
        onConfirmBtnTap: () async {
          await StorageProvider.write(StorageKey.status, '');
          await StorageProvider.write(StorageKey.token, '');
          Get.offAllNamed(Routes.LOGIN);
        }
    );
  }

  Future<void> getUserProfile() async {
    try {
      loading(true);
      final response = await ApiProvider.instance().get(Endpoint.user,
          queryParameters: {
            "id": StorageProvider.read(StorageKey.idUser),
          },
      );
      if (response.statusCode == 200) {
        loading(false);
        final result = ResponseUser.fromJson(response.data);
        if (result.data != null) {
          dataUser.value = result.data!;
        }
      }
    } catch (e) {
      loading(false);
      log(e.toString());
    }
  }

  void increment() => count.value++;
}
