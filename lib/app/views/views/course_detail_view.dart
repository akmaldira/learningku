import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CourseDetailView extends GetView {
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
