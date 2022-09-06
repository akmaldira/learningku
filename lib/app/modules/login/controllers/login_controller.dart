import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningku/app/modules/home/views/home_view.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  FirebaseAuth auth = FirebaseAuth.instance;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (err) {
      var errorMessage = null;
      print(err.code);
      switch (err.code) {
        case "invalid-email":
          errorMessage = "Email yang dimasukkan salah.";
          break;
        case "wrong-password":
          errorMessage = "Password anda salah.";
          break;
        case "user-not-found":
          errorMessage = "Email tidak ditemukan, silakan mendaftar.";
          break;
        case "too-many-requests":
          errorMessage = "Terlalu banyak percobaan, coba lagi nanti.";
          break;
        default:
          errorMessage = "Error tidak diketahui.";
      }
      if (errorMessage != null) {
        Get.snackbar(
          'Login Error',
          'error',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            'Error login',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            errorMessage,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      } else {
        Get.off(HomeView());
      }
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
