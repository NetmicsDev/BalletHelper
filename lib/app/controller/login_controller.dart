import 'dart:async';
import 'dart:developer';

import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/data/provider/login_provider.dart';
import 'package:ballet_helper/app/data/repository/login_repository.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheets.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'home_controller.dart';

enum UserType { parent, teacher, owner }

class LoginController extends GetxController with SingleGetTickerProviderMixin {
  final LoginRepository _repository =
      LoginRepository(Get.find<LoginProvider>());

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
  final currentPageIndex = 0.obs;

  UserType? currentUserType;
  String? code;

  @override
  void onInit() {
    super.onInit();
    pageController = TabController(length: pages.length, vsync: this);
    pageController.addListener(() {
      currentPageIndex.value = pageController.index;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // true -> pop을 했다. false -> pop을 할 수 없다.
  bool pop() {
    bool isRoot = currentPageIndex.value == 0;
    if (!isRoot) {
      if (currentPageIndex.value == 5) {
        pageController.index = 1;
      } else if (currentPageIndex.value == 4 &&
          currentUserType == UserType.owner) {
        pageController.index = 1;
      } else {
        pageController.index = currentPageIndex.value - 1;
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

  showUserTypeModal() async {
    final result = await BottomSheets.select(
      title: '어떤 회원으로 체험하시겠어요?',
      options: userTypes.map<String>((e) => e['label']).toList(),
    );
    if (result == null) return;
    Get.put(
        HomeController(isPreview: true, userType: userTypes[result]['type']));
    await Get.toNamed(Routes.preview, arguments: result);
    Get.delete<HomeController>();
  }

  signIn({required String email, required String password}) async {
    final result = await _repository.signIn(
        type: currentUserType!, email: email, password: password);
    if (result['result']) {
      String uid = result['uid'];
      String userType = result['userType'];
      Map<String, dynamic> userData =
          UserModel.fromJson(result['userData']).toJson();
      await GetStorage().write('login', {
        'uid': uid,
        'userType': userType,
        'userData': userData,
      });
      Get.offAllNamed(Routes.home);
    } else {
      Dialogs.alert(
        title: '로그인 실패',
        content: result['message'],
      );
    }
  }
}
