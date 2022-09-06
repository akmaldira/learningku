import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learningku/app/modules/login/views/login_view.dart';
import 'package:learningku/app/widgets/button.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
          child: MyElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Get.offAll(LoginScreen());
        },
        child: Text('Keluar'),
        height: 57,
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 33, 200, 246),
          Color.fromARGB(255, 99, 123, 255)
        ]),
        shadow: BoxShadow(
          color: Colors.black.withOpacity(0.25),
          blurRadius: 5,
          offset: const Offset(0, 5), // Shadow position
        ),
      )),
    );
  }
}
