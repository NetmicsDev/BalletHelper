import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/ui/screen/login/code_check_page.dart';
import 'package:ballet_helper/app/ui/screen/login/sign_in_page.dart';
import 'package:ballet_helper/app/ui/screen/login/sign_up_page.dart';
import 'package:ballet_helper/app/ui/screen/login/user_type_page.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'choose_sign_page.dart';
import 'code_result_page.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !controller.pop();
      },
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: TabBarView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: controller.pages.map((name) {
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
              case 'CODE_RESULT':
                page = CodeResultPage();
                break;
              case 'SIGN_IN':
                page = SignInPage();
                break;
              case 'SIGN_UP':
                page = SignUpPage();
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
