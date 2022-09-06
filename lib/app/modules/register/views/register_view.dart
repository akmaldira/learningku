import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:learningku/app/modules/login/views/login_view.dart';
import 'package:learningku/app/widgets/login_background.dart';

import '../../../widgets/button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  var error = null;

  bool nameValidate() {
    if (_nameController.text.trim().length > 7) {
      return true;
    } else {
      error = 'Nama harus lebih dari 7 huruf';
      return false;
    }
  }

  bool emailValidate() {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text.trim())) {
      return true;
    } else {
      error = 'Harap mengisi format email dengan benar';
      return false;
    }
  }

  bool passwordValidate() {
    if (_passwordController.text.length > 7) {
      return true;
    } else {
      error = 'Password harus berisi lebih dari 7 huruf';
      return false;
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text == _confirmPasswordController.text) {
      return true;
    } else {
      error = 'Password dan konfirmasi password harus sama';
      return false;
    }
  }

  void register() async {
    try {
      if (nameValidate() &&
          emailValidate() &&
          passwordValidate() &&
          passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text);
      } else {
        Get.snackbar(
          'Validasi Error',
          'Validasi',
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            'Error',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          messageText: Text(
            error,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
      }
    } catch (err) {
      print(err);
      Get.snackbar(
        'Validasi Error',
        'Validasi',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.TOP,
        titleText: Text(
          'Error',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          err.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Background(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: 'Nama',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _nameController,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _emailController,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _passwordController,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Konfirmasi Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          controller: _confirmPasswordController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: MyElevatedButton(
                          width: double.infinity,
                          height: 57,
                          gradient: const LinearGradient(
                              colors: [Color(0xFF21C8F6), Color(0xFF637BFF)]),
                          shadow: BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 5,
                            offset: const Offset(0, 5), // Shadow position
                          ),
                          onPressed: register,
                          borderRadius: BorderRadius.circular(40),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 15),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sudah punya akun? ',
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color:
                                      const Color(0xFF21C8F6).withOpacity(0.8),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.to(LoginScreen());
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
