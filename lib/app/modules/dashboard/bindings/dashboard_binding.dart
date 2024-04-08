import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/adminpage/controllers/adminpage_controller.dart';
import 'package:nowlib_peminjam/app/modules/data_peminjaman/controllers/data_peminjaman_controller.dart';
import 'package:nowlib_peminjam/app/modules/detail_buku/controllers/detail_buku_controller.dart';
import 'package:nowlib_peminjam/app/modules/home/controllers/home_controller.dart';
import 'package:nowlib_peminjam/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:nowlib_peminjam/app/modules/konfirmasi/controllers/konfirmasi_controller.dart';
import 'package:nowlib_peminjam/app/modules/peminjaman/controllers/peminjaman_controller.dart';
import 'package:nowlib_peminjam/app/modules/profile/controllers/profile_controller.dart';
import 'package:nowlib_peminjam/app/modules/splashscreen/controllers/splashscreen_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    //admin
    Get.lazyPut<AdminpageController>(
      () => AdminpageController(),
    );
    Get.lazyPut<DataPeminjamanController>(
      () => DataPeminjamanController(),
    );
    Get.lazyPut<KonfirmasiController>(
      () => KonfirmasiController(),
    );
    //user
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<KoleksiController>(
      () => KoleksiController(),
    );
    Get.lazyPut<PeminjamanController>(
      () => PeminjamanController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<DetailBukuController>(
      () => DetailBukuController(),
    );
  }
}
