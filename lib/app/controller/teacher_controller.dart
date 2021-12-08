import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class TeacherController extends GetxController {
  final _mainController = Get.find<MainController>();
  bool get isPreview => _mainController.isPreview;

  final _teacherList = <UserModel>[].obs;
  List<UserModel> get teacherList => _teacherList;
  List<String> get branchList => _mainController.userData.branchName;
  List<String> get classList => _mainController.userData.className;
  List<String> get positionList => DummyDatas.positionList;

  bool get isEdit => teacherModel != null;

  final selectedBranch = <String>[].obs;
  final selectedClass = <String>[].obs;
  final _selectedPosition = ''.obs;
  get selectedPosition => _selectedPosition.value;
  set selectedPosition(value) => _selectedPosition.value = value;

  UserModel? teacherModel;
  final nameTEC = TextEditingController();
  final phoneTEC = TextEditingController();
  final branchTEC = TextEditingController();
  final classTEC = TextEditingController();
  final positionTEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getTeacherList();
  }

  @override
  onClose() {
    nameTEC.dispose();
    phoneTEC.dispose();
    branchTEC.dispose();
    classTEC.dispose();
    positionTEC.dispose();
    super.onClose();
  }

  getTeacherList() async {
    final result = isPreview ? DummyDatas.teacherList : <UserModel>[];
    _teacherList.addAll(result);
  }

  showTeacherInfo(int idx) async {
    final result = await Dialogs.teacherInfo(teacherList[idx]);
    if (result == 'edit') {
      setDataForFix(teacherList[idx]);
      goToPost();
    } else if (result == 'delete') {}
  }

  goToPost() async {
    await Get.toNamed(Routes.teacherPost);
  }

  initPostData() {
    teacherModel = null;
    nameTEC.clear();
    phoneTEC.clear();
    branchTEC.clear();
    classTEC.clear();
    positionTEC.clear();
    selectedBranch.clear();
    selectedClass.clear();
  }

  setDataForAdd() {
    selectedPosition = positionList[0];
  }

  setDataForFix(UserModel data) {
    teacherModel = data;
    nameTEC.text = data.name!;
    phoneTEC.text = data.phone ?? '';
    branchTEC.text = data.phone ?? '';
    classTEC.text = data.phone ?? '';
    positionTEC.text = data.phone ?? '';
    selectedBranch.addAll(data.branchName!);
    selectedClass.addAll(data.className!);
    selectedPosition = data.position;
  }

  addTeacher() {
    final name = nameTEC.text;
    if (name == '') {
      return false;
    }
    final data = UserModel(
      name: nameTEC.text,
      profile: 'assets/images/test_teacher_avatar.png',
      phone: phoneTEC.text,
      branchName: selectedBranch,
      className: selectedClass,
      position: selectedPosition,
    );
    isPreview ? teacherList.add(data) : () {};

    initPostData();
    return true;
  }

  fixTeacher() {
    final name = nameTEC.text;
    if (name == '') {
      return false;
    }
    final data = UserModel(
      name: nameTEC.text,
      profile: teacherModel?.profile,
      phone: phoneTEC.text,
      branchName: List.from(selectedBranch),
      className: List.from(selectedClass),
      position: selectedPosition,
    );
    int index = _teacherList.indexOf(teacherModel);
    isPreview ? (_teacherList[index] = data) : () {};

    initPostData();
    return true;
  }

  post() => isEdit ? fixTeacher() : addTeacher();
}
