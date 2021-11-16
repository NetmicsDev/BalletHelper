import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class ChooseSignPage extends StatefulWidget {
  ChooseSignPage({Key? key}) : super(key: key);

  @override
  _ChooseSignPageState createState() => _ChooseSignPageState();
}

class _ChooseSignPageState extends State<ChooseSignPage> {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => _controller.pageController.animateTo(2),
        child: Text('회원가입'),
      ),
    );
  }
}
