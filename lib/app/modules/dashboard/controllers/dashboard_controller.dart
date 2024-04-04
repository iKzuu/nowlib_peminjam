import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nowlib_peminjam/app/data/provider/storage_provider.dart';
import 'package:nowlib_peminjam/app/modules/adminpage/views/adminpage_view.dart';
import 'package:nowlib_peminjam/app/modules/home/controllers/home_controller.dart';
import 'package:nowlib_peminjam/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:nowlib_peminjam/app/modules/peminjaman/controllers/peminjaman_controller.dart';
import 'package:nowlib_peminjam/app/modules/profile/controllers/profile_controller.dart';

import '../../home/views/home_view.dart';
import '../../koleksi/views/koleksi_view.dart';
import '../../peminjaman/views/peminjaman_view.dart';
import '../../profile/views/profile_view.dart';

class DashboardController extends GetxController {
  var role = '';
  var tabIndex = 0.obs;

  HomeController homeController = Get.put(HomeController(), permanent: true);
  PeminjamanController peminjamanController = Get.put(PeminjamanController(), permanent: true);
  ProfileController profileController = Get.put(ProfileController(), permanent:  true);
  KoleksiController koleksiController = Get.put(KoleksiController(), permanent:  true);


  final screen = const [
    HomeView(),
    KoleksiView(),
    PeminjamanView(),
    ProfileView(),
  ];
  final screenAdmin = const [
    AdminpageView(),
    AdminpageView(),
    AdminpageView(),
    AdminpageView(),
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkRole();
  }

  @override
  void onReady() {
    super.onReady();
  }

  checkRole() async {
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    role = decodedToken['role'];
    print("Role: $role");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
