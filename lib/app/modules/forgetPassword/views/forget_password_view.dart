import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learningku/app/modules/login/views/login_view.dart';
import 'package:learningku/app/widgets/button.dart';
import 'package:learningku/app/widgets/login_background.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<ForgetPasswordScreen> {
  @override
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
                        textInputAction: TextInputAction.next,
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
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(40),
                        child: const Text(
                          'Ganti password',
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
                            text: 'Sudah ingat passwword? ',
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
                                color: const Color(0xFF21C8F6).withOpacity(0.8),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.to(LoginScreen());
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
