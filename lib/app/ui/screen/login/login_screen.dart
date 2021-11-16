import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/ui/screen/login/code_check_page.dart';
import 'package:ballet_helper/app/ui/screen/login/user_type_page.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_sign_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !_controller.pop();
      },
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: TabBarView(
          controller: _controller.pageController,
          children: _controller.pages.map((name) {
            switch (name) {
              case 'USER_TYPE':
                return UserTypePage();
              case 'CHOOSE_SIGN':
                return ChooseSignPage();
              case 'CODE_CHECK':
                return CodeCheckPage();
              default:
                return Container();
            }
          }).toList(),
        ),
      ),
    );
  }
}
