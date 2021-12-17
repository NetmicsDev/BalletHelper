import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/image_model.dart';
import 'package:ballet_helper/app/data/model/parent_model.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/data/provider/home_provider.dart';
import 'package:ballet_helper/app/data/repository/home_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  late final HomeRepository _repository;
  late final bool isPreview;
  late final UserType userType;

  final storageData = GetStorage().read('login');

  HomeController({bool? isPreview, UserType? userType}) {
    this.isPreview = isPreview ?? false;
    this.userType = userType ??
        (storageData['userType'] == 'teacher'
            ? UserType.owner
            : UserType.parent);
    _repository = HomeRepository(
        this.isPreview ? HomeProvider() : Get.find<HomeProvider>());
    log('${this.isPreview} ${this.userType}');
  }

  get userData => userType == UserType.parent ? parentData : teacherData;
  final _teacherData = UserModel().obs;
  UserModel get teacherData => _teacherData.value;
  set teacherData(UserModel value) => _teacherData.value = value;
  final _parentData = ParentModel().obs;
  ParentModel get parentData => _parentData.value;
  set parentData(ParentModel value) => _parentData.value = value;
  final imageList = <ImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    userType == UserType.parent ? getParentData() : getUserData();
    getImageList();
  }

  get branchName => userType == UserType.parent
      ? parentData.student!.branchName ?? '-'
      : teacherData.branchName ?? '-';
  get className => userType == UserType.parent
      ? parentData.student!.className ?? '-'
      : teacherData.className ?? '-';

  String get userName {
    switch (userType) {
      case UserType.parent:
        return parentData.name!;
      case UserType.teacher:
        return '${teacherData.name} 쌤';
      case UserType.owner:
        return '${teacherData.name} 원장님';
      default:
        return teacherData.name!;
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
    if (isPreview) {
      teacherData =
          userType == UserType.owner ? DummyDatas.owner : DummyDatas.teacher;
    } else {
      // _repository.getTeachers();
      teacherData = UserModel.fromJson(storageData['userData']);
      log(teacherData.toJson().toString());
    }
  }

  getParentData() {
    if (isPreview) {
      parentData = DummyDatas.parent;
    } else {
      // _repository.getTeachers();
      teacherData = UserModel.fromJson(storageData['userData']);
      log(teacherData.toJson().toString());
    }
  }

  getImageList() {
    imageList.addAll(DummyDatas.imageList);
  }
}
