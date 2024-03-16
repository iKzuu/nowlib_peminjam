import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
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

  final List<Widget> _pages = [
    HomeView(),
    KoleksiView(),
    PeminjamanView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.grey,
        buttonBackgroundColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
  return CurvedNavigationBarItem(
      child: Icon(icon),
      label: label,
  );
}

