import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nowlib_peminjam/themes.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF373737),
      appBar: AppBar(
        backgroundColor: Color(0xFF00A3FF),
        foregroundColor: Colors.white,
        title: Text('Profile', style: regularFont,),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.logout();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Text("Comingsoon..."),
      ),
    );
  }
}
