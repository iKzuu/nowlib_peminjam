import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/login/views/login_view.dart';

import '../../../../themes.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 163, 255),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/nowlib.png',
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20.0),
            Container(
              width: 320.0,
              height: 460.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white.withOpacity(0.8),
                  border: Border.all(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child:
                  Form(
                    key: controller.formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30.0),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 250.0),
                            child: TextFormField(
                              controller: controller.usernameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Username',
                                labelStyle: regularFont3,
                                prefixIcon: const Icon(Icons.person),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15.0),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 250.0),
                            child: TextFormField(
                              controller: controller.emailController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Email',
                                labelStyle: regularFont3,
                                prefixIcon: Icon(Icons.mail),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15.0),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 250.0),
                            child: TextFormField(
                              controller: controller.namaLengkapController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Nama Lengkap',
                                labelStyle: regularFont3,
                                prefixIcon: Icon(Icons.person_outline),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
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
                                fillColor: Colors.white,
                                labelText: 'Password',
                                labelStyle: regularFont3,
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15.0),

                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 250.0),
                            child: TextFormField(
                              controller: controller.alamatController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'Alamat',
                                labelStyle: regularFont3,
                                prefixIcon: Icon(Icons.map),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 22.0),

                          Obx(() => controller.loading.value?
                          CircularProgressIndicator():
                          ElevatedButton(
                            onPressed: () {
                              controller.register();
                            },
                            child: Text(
                              "Daftar",
                              style: regularFont3,
                            ),
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
                          )
                        ],
                      ),
                  ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextButton(
                onPressed: () => Get.offAndToNamed(Routes.LOGIN),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      'Back To Login',
                      style: regularFont4.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
