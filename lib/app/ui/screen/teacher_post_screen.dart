import 'package:ballet_helper/app/controller/teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherPostScreen extends GetView<TeacherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TeacherPostPage')),
        body: SafeArea(child: Text('TeacherController')));
  }
}
