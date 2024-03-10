import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_register.dart';
import '../../../data/provider/api_provider.dart';
import '../../../routes/app_pages.dart';


class RegisterController extends GetxController with StateMixin<List<DataRegister>> {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

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

  void increment() => count.value++;

  register() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //ngeclose keyboard
      formKey.currentState?.save();
      if(formKey.currentState!.validate()) {

        if (usernameController.text.isEmpty ||
            emailController.text.isEmpty ||
            namaLengkapController.text.isEmpty ||
            alamatController.text.isEmpty ||
            passwordController.text.isEmpty) {
          Get.snackbar("Alert", "Mohon isi form yang kosong", backgroundColor: Colors.orangeAccent);
          loading(false);
          return;
        }

        final response = await ApiProvider.instance().post(Endpoint.register,
            data: (
                {
                  "Username" : usernameController.text.toString(),
                  "Email" : emailController.text.toString(),
                  "Namalengkap": namaLengkapController.text.toString(),
                  "Alamat": alamatController.text.toString(),
                  "Password": passwordController.text.toString(),
                }
            )
        );
        if (response.statusCode == 201) {
          Get.snackbar("Selamat", "Register berhasil", backgroundColor: Colors.green);
          Get.offAllNamed(Routes.LOGIN);
        }else{
          Get.snackbar("Sorry", "Register gagal", backgroundColor: Colors.orange);
        }
      }loading(false);
    }on DioException catch (e){
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
        }
      }else{
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
        log(e.message.toString());
      }
    }catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }

}
