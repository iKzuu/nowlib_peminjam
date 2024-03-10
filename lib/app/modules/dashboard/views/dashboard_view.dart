import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/app/modules/home/views/home_view.dart';
import 'package:nowlib_peminjam/app/modules/koleksi/views/koleksi_view.dart';
import 'package:nowlib_peminjam/app/modules/peminjaman/views/peminjaman_view.dart';
import 'package:nowlib_peminjam/app/modules/profile/views/profile_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            HomeView(),
            KoleksiView(),
            PeminjamanView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.greenAccent,
        selectedItemColor: Colors.lightBlue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        iconSize: 35.0,
        items: [
          _bottomNavigationBarItem(
            icon: Icons.home_outlined,
            label: 'Home',
          ),
          _bottomNavigationBarItem(
            icon: Icons.collections_bookmark_outlined,
            label: 'Koleksi',
          ),
          _bottomNavigationBarItem(
            icon: Icons.menu_book_outlined,
            label: 'Riwayat',
          ),
          _bottomNavigationBarItem(
            icon: Icons.person_outlined,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

_bottomNavigationBarItem({icon, label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}

