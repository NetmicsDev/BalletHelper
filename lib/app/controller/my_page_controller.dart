import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyPageController extends GetxController {
  final _mainController = Get.find<MainController>();
  UserType get userType => _mainController.userType;
  UserModel get userData => _mainController.userData;
  String get birth {
    final date = userData.birth!.split('-');
    return '${date[0]}년 ${date[1]}월 ${date[2]}일';
  }

  final _relation = '어머니'.obs;
  String get relation => _relation.value;
  set relation(String value) => _relation.value = value;
  late final TextEditingController phoneTEC;

  @override
  void onInit() {
    super.onInit();
    phoneTEC = TextEditingController(text: userData.phone);
  }

  @override
  void onClose() {
    phoneTEC.dispose();
    super.onClose();
  }

  edit() async {
    if (userData.phone == phoneTEC.text) {
      Get.dialog(Dialogs.alert(title: '수정 불가', content: '수정된 사항이 없습니다'));
    } else {
      if (!_mainController.isPreview) {
        // TODO: 유저 정보 수정 요청
      }
      await Get.dialog(
          Dialogs.alert(title: '수정 완료', content: '회원님의 정보가 수정되었습니다'));
      Get.back();
    }
  }
}
