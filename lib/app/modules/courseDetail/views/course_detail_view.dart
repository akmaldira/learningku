import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/course_detail_controller.dart';

class CourseDetailView extends GetView<CourseDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CourseDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CourseDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
