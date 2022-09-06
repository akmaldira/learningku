import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF21C8F6),
                Color(0xFF637BFF),
              ],
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/character1.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
