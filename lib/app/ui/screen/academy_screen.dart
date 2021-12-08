import 'package:ballet_helper/app/controller/academy_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcademyScreen extends GetView<AcademyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('AcademyPage')),
        body: SafeArea(child: Text('AcademyController')));
  }
}
