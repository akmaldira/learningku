import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:learningku/app/modules/courseDetail/views/course_detail_view.dart';
import 'package:learningku/app/modules/profile/views/profile_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        leadingWidth: 80,
        titleSpacing: 0,
        title: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: 'Selamat Datang',
            style: TextStyle(
              fontFamily: 'DM Sans',
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: Color(0xFF222222),
            ),
            children: <TextSpan>[
              TextSpan(
                  text: '\nMahmoud.S',
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: Container(
                margin: EdgeInsets.only(right: 15),
                width: 25,
                height: 25,
                child:
                    Image.asset('assets/images/bell.png', fit: BoxFit.contain)),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF21C8F6),
                    Color(0xFF637BFF),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Kamu belum memiliki kelas',
                  style: TextStyle(
                    fontFamily: 'DM Sans',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            color: Colors.white,
            child: Center(
              child: Text(
                '-- Rekomendasi --',
                style: TextStyle(
                  color: Color(0xFF161719),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              height: 100,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        CourseBanner(
                          colorHex1: '0xFFFFB976',
                          colorHex2: '0xFFFF922A',
                          courseImage: 'GraduationCap',
                          courseName: 'Belajar Speaking 1',
                          courseDesc: 'Kamu akan belajar',
                          coursePrice: 'Gratis',
                          courseRating: 4,
                          courseAuthor: 'Sarah Wiliam',
                          courseLevel: 'Dasar',
                        ),
                        CourseBanner(
                          colorHex1: '0xFF1CE7FF',
                          colorHex2: '0xFF00CFE8',
                          courseImage: 'GraduationCap',
                          courseName: 'Belajar Speaking 2',
                          courseDesc: 'Kamu akan belajar',
                          coursePrice: 'Gratis',
                          courseRating: 3,
                          courseAuthor: 'Sarah Wiliam',
                          courseLevel: 'Menengah',
                        ),
                        CourseBanner(
                          colorHex1: '0xFF48DA89',
                          colorHex2: '0xFF48DA89',
                          courseImage: 'GraduationCap',
                          courseName: 'Belajar Speaking 3',
                          courseDesc: 'Kamu akan belajar',
                          coursePrice: 'Gratis',
                          courseRating: 5,
                          courseAuthor: 'Sarah Wiliam',
                          courseLevel: 'Atas',
                        ),
                        CourseBanner(
                          colorHex1: '0xFFFFB976',
                          colorHex2: '0xFFFF922A',
                          courseImage: 'GraduationCap',
                          courseName: 'Belajar Listening 1',
                          courseDesc: 'Kamu akan belajar',
                          coursePrice: 'Gratis',
                          courseRating: 5,
                          courseAuthor: 'Sarah Wiliam',
                          courseLevel: 'Dasar',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          child: NavItem(
                            status: true,
                            icon: 'home',
                          ),
                          onTap: () {
                            print('Home');
                          },
                        ),
                        GestureDetector(
                          child: NavItem(
                            status: false,
                            icon: 'search',
                          ),
                          onTap: () {
                            print('Home');
                          },
                        ),
                        GestureDetector(
                          child: NavItem(
                            status: false,
                            icon: 'course',
                          ),
                          onTap: () {
                            print('Home');
                          },
                        ),
                        GestureDetector(
                          child: NavItem(
                            status: false,
                            icon: 'user',
                          ),
                          onTap: () {
                            Get.off(ProfileView());
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CourseBanner extends StatelessWidget {
  const CourseBanner({
    Key? key,
    required this.colorHex1,
    required this.colorHex2,
    required this.courseImage,
    required this.courseName,
    required this.courseDesc,
    required this.coursePrice,
    required this.courseRating,
    required this.courseAuthor,
    required this.courseLevel,
  }) : super(key: key);

  final String colorHex1;
  final String colorHex2;
  final String courseImage;
  final String courseName;
  final String courseDesc;
  final String coursePrice;
  final int courseRating;
  final String courseAuthor;
  final String courseLevel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(CourseDetailView());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 110,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(int.parse(colorHex1)),
                      Color(int.parse(colorHex2)),
                    ],
                  ),
                ),
                child: Center(
                    child: Image.asset('assets/images/$courseImage.png')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          courseName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Deskripsi : $courseDesc',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontFamily: 'DM Sans',
                            color: Color(0xFF222222).withOpacity(0.4),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Harga : $coursePrice',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: '\u{2605} $courseRating \u{2022} ',
                            style: TextStyle(
                              color: Color(0xFF222222).withOpacity(0.4),
                              fontFamily: 'DM Sans',
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'By $courseAuthor \u{2022} $courseLevel',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key? key,
    required this.status,
    required this.icon,
  }) : super(key: key);

  final bool status;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 25,
          child: Image.asset(
            (status == true)
                ? 'assets/images/$icon-active.png'
                : 'assets/images/$icon.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
