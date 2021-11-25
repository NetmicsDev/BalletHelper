import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/image_model.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController({bool? isPreview, UserType? userType}) {
    this.isPreview = isPreview ?? false;
    this.userType = userType ?? _loginController.currentUserType!;
    log('$isPreview $userType');
  }
  final LoginController _loginController = Get.find();
  late final bool isPreview;
  late final UserType userType;

  UserModel get userData => isPreview ? getDummyUserData() : getUserData();
  List<ImageModel> get imageList =>
      isPreview ? getDummyImageList() : getImageList();
  List<StudentModel> get studentList =>
      isPreview ? getDummyStudentList() : getStudentList();

  String get userName {
    switch (userType) {
      case UserType.parent:
        return userData.name!;
      case UserType.teacher:
        return '${userData.name} 쌤';
      case UserType.owner:
        return '${userData.name} 원장님';
      default:
        return userData.name!;
    }
  }

  getDummyUserData() {
    switch (userType) {
      case UserType.parent:
        return DummyDatas.parent;
      case UserType.teacher:
        return DummyDatas.teacher;
      case UserType.owner:
        return DummyDatas.owner;
      default:
        return DummyDatas.parent;
    }
  }

  getUserData() {
    return {};
  }

  getDummyImageList() {
    return DummyDatas.imageList;
  }

  getImageList() {
    return [];
  }

  getDummyStudentList() {
    return DummyDatas.studentList;
  }

  getStudentList() {
    return [];
  }
}
