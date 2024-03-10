import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/home/views/home_view.dart';

import '../../../routes/app_pages.dart';
import '../../register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: const Text('LoginView'),
      //   centerTitle: true,
      // ),
      backgroundColor: const Color.fromARGB(255, 0, 163, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/nowlib.png',
              width: 235.0,
              height: 235.0,
            ),
            const SizedBox(height: 30.0),
            Container(
              width: 350.0,
              height: 280.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 123, 123, 123),
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(30.0)
              ),
              child:
                  Form(
                    key: controller.formKey,
                      child:
                      Column(
                        children: [
                          const SizedBox(height: 40.0),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 250.0),
                            child: TextFormField(
                              controller: controller.usernameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                labelText: 'Username',
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15.0),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 250.0),
                            child: TextFormField(
                              controller: controller.passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.transparent,
                                labelText: 'Password',
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 35.0),

                          Obx(() => controller.loading.value?
                          CircularProgressIndicator():
                          ElevatedButton(
                            onPressed: () {
                              controller.login();
                            },
                            child: Text("Login"),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent), // Ubah warna latar belakang
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Ubah warna teks
                              minimumSize: MaterialStateProperty.all<Size>(Size(80.0, 50.0)), // Mengatur tinggi minimum
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                  )
            ),

            const SizedBox(height: 35.0),

            TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),// Gunakan Get.to untuk navigasi menggunakan GetX
              child: const Text(
                'Daftar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
