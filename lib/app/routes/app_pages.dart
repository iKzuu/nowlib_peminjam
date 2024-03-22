import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_buku/bindings/detail_buku_binding.dart';
import '../modules/detail_buku/views/detail_buku_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/koleksi/bindings/koleksi_binding.dart';
import '../modules/koleksi/views/koleksi_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/meminjamn/bindings/meminjamn_binding.dart';
import '../modules/meminjamn/views/meminjamn_view.dart';
import '../modules/peminjaman/bindings/peminjaman_binding.dart';
import '../modules/peminjaman/views/peminjaman_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => const PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
    GetPage(
      name: _Paths.KOLEKSI,
      page: () => const KoleksiView(),
      binding: KoleksiBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BUKU,
      page: () => const DetailBukuView(),
      binding: DetailBukuBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.MEMINJAMN,
      page: () => const MeminjamnView(),
      binding: MeminjamnBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
  ];
}
