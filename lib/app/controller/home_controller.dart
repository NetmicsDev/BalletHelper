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
  final HomeRepository _repository = HomeRepository(Get.find<HomeProvider>());
  late final bool isPreview;
  late final UserType userType;

  final storageData = GetStorage().read('login');

  HomeController({bool? isPreview, UserType? userType}) {
    this.isPreview = isPreview ?? false;
    this.userType = userType ??
        (storageData['userType'] == 'teacher'
            ? UserType.owner
            : UserType.parent);
    log('${this.isPreview} ${this.userType}');
  }

  final _userData = UserModel().obs;
  UserModel get userData => _userData.value;
  set userData(UserModel value) => _userData.value = value;
  final _parentData = ParentModel().obs;
  ParentModel get parentData => _parentData.value;
  set parentData(ParentModel value) => _parentData.value = value;
  final imageList = <ImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    userType == UserType.owner ? getUserData() : getParentData();
    getImageList();
  }

  get branchName => userType == UserType.parent
      ? parentData.student!.branchName ?? '-'
      : userData.branchName!;
  get className => userType == UserType.parent
      ? parentData.student!.className
      : userData.className!;

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
    if (isPreview) {
      userData = DummyDatas.teacher;
    } else {
      // _repository.getTeachers();
      userData = UserModel.fromJson(storageData['userData']);
      log(userData.toJson().toString());
    }
  }

  getParentData() {}

  getImageList() {
    imageList.addAll(DummyDatas.imageList);
  }
}
