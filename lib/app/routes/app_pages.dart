import 'package:get/get.dart';

import 'package:learningku/app/modules/courseDetail/bindings/course_detail_binding.dart';
import 'package:learningku/app/modules/courseDetail/views/course_detail_view.dart';
import 'package:learningku/app/modules/forgetPassword/bindings/forget_password_binding.dart';
import 'package:learningku/app/modules/forgetPassword/views/forget_password_view.dart';
import 'package:learningku/app/modules/home/bindings/home_binding.dart';
import 'package:learningku/app/modules/home/views/home_view.dart';
import 'package:learningku/app/modules/login/bindings/login_binding.dart';
import 'package:learningku/app/modules/login/views/login_view.dart';
import 'package:learningku/app/modules/profile/bindings/profile_binding.dart';
import 'package:learningku/app/modules/profile/views/profile_view.dart';
import 'package:learningku/app/modules/register/bindings/register_binding.dart';
import 'package:learningku/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.COURSE_DETAIL,
      page: () => CourseDetailView(),
      binding: CourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
