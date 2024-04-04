import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/data/model/response_login.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: {
              "Username": usernameController.text.toString(),
              "Password": passwordController.text.toString()
            });
        if (response.statusCode == 201) {
          ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
          await StorageProvider.write(
            StorageKey.idUser, responseLogin.data!.userID.toString(),
          );
          await StorageProvider.write(
            StorageKey.namalengkap, responseLogin.data!.namalengkap.toString(),
          );
          await StorageProvider.write(
            StorageKey.alamat,responseLogin.data!.alamat.toString(),
          );
          // await StorageProvider.write(
          //   StorageKey.role,responseData['data']['Role'].toString(),
          // );
          await StorageProvider.write(StorageKey.status, "logged");
          print("Status: ${StorageProvider.read(StorageKey.status)}");
          await StorageProvider.write(StorageKey.token,responseLogin.token!);
          // final role = responseData['data']['Role'];
          // final prefs = await SharedPreferences.getInstance();
          Get.offAllNamed(Routes.DASHBOARD);
          // if (role == 'admin' || role == 'petugas') {
          //   // Redirect to admin page
          //   Get.offAllNamed(Routes.ADMINPAGE);
          // } else {
          //   // Redirect to dashboard for regular user
          //   Get.offAllNamed(Routes.DASHBOARD);
          // }
        } else {
          Get.snackbar("Sorry", response.data['message'], backgroundColor: Colors.orange);
        }
      }
    } on dio.DioError catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data ?? {};
        Get.snackbar("Sorry", responseData['message'] ?? "", backgroundColor: Colors.orange);
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
