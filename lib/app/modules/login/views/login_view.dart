import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:learningku/app/modules/forgetPassword/views/forget_password_view.dart';
import 'package:learningku/app/modules/login/controllers/login_controller.dart';
import 'package:learningku/app/modules/register/views/register_view.dart';
import 'package:learningku/app/widgets/button.dart';
import 'package:learningku/app/widgets/login_background.dart';

class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() {
    LoginController.instance
        .login(_emailController.text.trim(), _passwordController.text);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Background(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 25, right: 25, bottom: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Text(
                        "Belajar bahasa inggris dengan mudah",
                        style: TextStyle(
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: TextField(
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
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        controller: _passwordController,
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 15),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Lupa password',
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xFF21C8F6).withOpacity(0.8),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(ForgetPasswordScreen());
                                }),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: MyElevatedButton(
                        width: double.infinity,
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
                        onPressed: () {
                          Get.put(LoginController());
                          login();
                        },
                        borderRadius: BorderRadius.circular(40),
                        child: const Text(
                          'Masuk',
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
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Belum mempunyai akun? ',
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          TextSpan(
                              text: 'Daftar',
                              style: TextStyle(
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: const Color(0xFF21C8F6).withOpacity(0.8),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(RegisterScreen());
                                }),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
