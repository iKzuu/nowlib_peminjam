import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token != null) {
      Get.offAllNamed(Routes.DASHBOARD);
    }

    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    // if (status == "logged"){
    //   Get.offAllNamed(Routes.DASHBOARD);
    // }
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
          final responseData = response.data;
          final token = responseData['data']['token'];
          await StorageProvider.write(
              StorageKey.idUser, responseData['data']['UserID'].toString());
          await StorageProvider.write(StorageKey.status, "logged");
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token ?? '');

          Get.offAllNamed(Routes.DASHBOARD);
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
