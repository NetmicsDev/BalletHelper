import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  final List pages = [
    'USER_TYPE', // 회원 권한 선택
    'CHOOSE_SIGN', // 로그인인지 회원가입인지
    'CODE_CHECK', // 보호자와 선생님 시 받은 코드 확인 (가입 시)
    'SIGNIN', // 로그인
    'SIGNUP' // 회원가입
  ];

  late TabController pageController;

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
      if (pageController.index == 4) {
        pageController.index = 1;
      } else {
        pageController.index = pageController.index - 1;
      }
    }
    return !isRoot;
  }
}
