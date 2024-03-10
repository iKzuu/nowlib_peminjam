import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/login/views/login_view.dart';

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
            const SizedBox(height: 30.0),
            Container(
              width: 350.0,
              height: 420.0,
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
                      child: Column(
                        children: [
                          const SizedBox(height: 30.0),
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
                                fillColor: Colors.transparent,
                                labelText: 'Email',
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
                                fillColor: Colors.transparent,
                                labelText: 'Nama Lengkap',
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
                                fillColor: Colors.transparent,
                                labelText: 'Password',
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
                                fillColor: Colors.transparent,
                                labelText: 'Alamat',
                                prefixIcon: Icon(Icons.map),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20.0),

                          Obx(() => controller.loading.value?
                          CircularProgressIndicator():
                          ElevatedButton(
                            onPressed: () {
                              controller.register();
                            },
                            child: Text("Daftar"),
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

            const SizedBox(height: 35.0),

            TextButton(
              onPressed: () => Get.toNamed(Routes.LOGIN),
              child: const Text(
                'Back To Login',
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
