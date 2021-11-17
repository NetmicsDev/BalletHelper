import 'dart:async';

import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum UserType { parent, teacher, owner }

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  final List<Map<String, dynamic>> userTypes = [
    {
      'type': UserType.parent,
      'label': Strings.parent,
      'content': Strings.parentContent,
    },
    {
      'type': UserType.teacher,
      'label': Strings.teacher,
      'content': Strings.teacherContent,
    },
    {
      'type': UserType.owner,
      'label': Strings.owner,
      'content': Strings.ownerContent,
    },
  ];
  final List pages = [
    'USER_TYPE', // 회원 권한 선택
    'CHOOSE_SIGN', // 로그인인지 회원가입인지
    'CODE_CHECK', // 보호자와 선생님 시 받은 코드 입력 (가입 시)
    'CODE_RESULT', // 아이 정보 혹은 선생님 정보 확인
    'SIGN_UP', // 회원가입
    'SIGN_IN', // 로그인
  ];

  late TabController pageController;

  UserType? currentUserType;
  String? code;

  @override
  void onInit() {
    super.onInit();
    pageController = TabController(length: pages.length, vsync: this);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // true -> pop을 했다. false -> pop을 할 수 없다.
  bool pop() {
    bool isRoot = pageController.index == 0;
    if (!isRoot) {
      if (pageController.index == 5) {
        pageController.index = 1;
      } else if (pageController.index == 4 &&
          currentUserType == UserType.owner) {
        pageController.index = 1;
      } else {
        pageController.index = pageController.index - 1;
      }
    }
    return !isRoot;
  }

  void toChooseSign(UserType userType) {
    this.currentUserType = userType;
    pageController.animateTo(1);
  }

  void toCodeCheck() {
    pageController.animateTo(2);
  }

  void toCodeResult(String code) async {
    this.code = code;
    // TODO: 입력한 코드로 서버 호출
    await Future.delayed(Duration(seconds: 1));
    pageController.animateTo(3);
  }

  void toSignIn() {
    pageController.animateTo(5);
  }

  void toSignUp() {
    pageController.animateTo(4);
  }
}
