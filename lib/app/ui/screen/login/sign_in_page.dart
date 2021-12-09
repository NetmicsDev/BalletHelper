import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';

class SignInPage extends GetView<LoginController> {
  SignInPage({Key? key}) : super(key: key);

  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: emailTEC,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '아이디',
          ),
        ),
        TextField(
          controller: passwordTEC,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '비밀번호',
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.signIn(
            email: emailTEC.text,
            password: passwordTEC.text,
          ),
          child: Text('로그인'),
        )
      ],
    );
  }
}
