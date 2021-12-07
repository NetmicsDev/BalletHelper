import 'package:ballet_helper/app/controller/teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherScreen extends GetView<TeacherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TeacherPage')),
        body: SafeArea(child: Text('TeacherController')));
  }
}
