import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get_instance/get_instance.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({Key? key}) : super(key: key);

  final int userType = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 40,
        title: Text(
          getTitle(),
          style: const TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: Get.back,
            icon: const Icon(Icons.close, size: 24),
          )
        ],
      ),
      body: HomeScreen(),
    );
  }

  String getTitle() {
    switch (userType) {
      case 0:
        return '보호자로 체험 중';
      case 1:
        return '선생님으로 체험 중';
      case 2:
        return '관리자로 체험 중';
      default:
        return '보호자로 체험 중';
    }
  }
}
