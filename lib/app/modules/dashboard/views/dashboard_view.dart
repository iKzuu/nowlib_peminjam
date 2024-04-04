import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';



class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  // const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.role == 'admin' || controller.role == 'petugas') {
          return controller.screenAdmin[controller.tabIndex.value];
        } else {
          return controller.screen[controller.tabIndex.value];
        }
      }),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        color: Colors.grey,
        buttonBackgroundColor: Colors.blue,
        onTap: (index) => controller.changeTabIndex(index),
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

