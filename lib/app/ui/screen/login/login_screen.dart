import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/ui/screen/login/code_check_page.dart';
import 'package:ballet_helper/app/ui/screen/login/user_type_page.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/page_wrapper.dart';
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
            late final Widget page;
            switch (name) {
              case 'USER_TYPE':
                page = UserTypePage();
                break;
              case 'CHOOSE_SIGN':
                page = ChooseSignPage();
                break;
              case 'CODE_CHECK':
                page = CodeCheckPage();
                break;
              default:
                page = Container();
                break;
            }
            return PageWrapper(page: page);
          }).toList(),
        ),
      ),
    );
  }
}
