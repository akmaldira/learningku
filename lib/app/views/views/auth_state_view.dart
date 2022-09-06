import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learningku/app/modules/home/views/home_view.dart';
import 'package:learningku/app/modules/login/views/login_view.dart';

class AuthStateView extends GetView {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return HomeView();
            } else {
              return LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
