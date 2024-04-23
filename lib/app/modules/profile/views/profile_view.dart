import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';
import '../../../others/imagememory/image_memory.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightBody = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    bool isZoomed = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(
              'assets/nowlib.png',
          ),
        ),
      ),
        body: SafeArea(
          child: Container(
              width: widthBody,
              height: heightBody,
              color: Color(0xFF373737),
              padding: const EdgeInsets.all(15),
              child: Obx(
                    () => controller.loading.value == true
                    ? const Center(
                  child: CircularProgressIndicator(),
                ) : SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: widthBody,
                            height: heightBody * 0.2,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  top: heightBody * 0.07,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3, color: Colors.white),
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                    child: ClipOval(
                                      child: controller.dataUser.value.profile == null
                                          ? const CircleAvatar(
                                          child: Icon(Icons.person))
                                          : Image(image: base64Image(controller.dataUser.value.profile!),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: heightBody * 0.01,
                                  right: widthBody * 0.32,
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: IconButton(onPressed: () {
                                      controller.changeProfilePicture();
                                    },
                                      icon: Icon(Icons.camera_alt_outlined),
                                      color: Colors.greenAccent,
                                      iconSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Kak ${controller.dataUser.value.username}",
                                style: regularFont2.copyWith(
                                  color: Colors.greenAccent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: heightBody * 0.01,
                              ),
                              Text(
                                controller.dataUser.value.namalengkap.toString(),
                                  style: regularFont3.copyWith(
                                    color: Colors.greenAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                              ),
                              SizedBox(
                                height: heightBody * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.dataUser.value.role!,
                                      style: regularFont3.copyWith(
                                        color: Colors.greenAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heightBody * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User info :",
                              style: regularFont4.copyWith(color: Colors.greenAccent)
                          ),
                          SizedBox(
                            height: heightBody * 0.02,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.email_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: widthBody * 0.03,
                                    ),
                                    Text(
                                      "Email",
                                        style: regularFont3.copyWith(color: Colors.greenAccent)
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                controller.dataUser.value.email!,
                                  style: regularFont3.copyWith(color: Colors.greenAccent)
                              )
                            ],
                          ),
                          SizedBox(
                            height: heightBody * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: widthBody * 0.03,
                                    ),
                                    Text(
                                      "Alamat",
                                        style: regularFont3.copyWith(color: Colors.greenAccent)
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                controller.dataUser.value.alamat!,
                                  style: regularFont3.copyWith(color: Colors.greenAccent)
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: heightBody * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: widthBody * 0.10,
                            alignment: Alignment.topRight,
                            height: 40,
                            child: IconButton(onPressed: () {
                              controller.logout();
                            },
                              icon: Icon(Icons.logout_rounded),
                              color: Colors.greenAccent,
                              iconSize: 35,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ));
  }
}
