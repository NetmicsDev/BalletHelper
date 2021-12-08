import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/branch_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcademyController extends GetxController {
  final _mainController = Get.find<MainController>();
  bool get isPreview => _mainController.isPreview;

  final branchList = <BranchModel>[].obs;

  bool get isEdit => branchModel != null;

  BranchModel? branchModel;
  final nameTEC = TextEditingController();
  final addressTEC = TextEditingController();
  final classTEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getBranchList();
  }

  @override
  void onClose() {
    nameTEC.dispose();
    addressTEC.dispose();
    classTEC.dispose();
    super.onClose();
  }

  getBranchList() async {
    branchList.addAll(isPreview ? DummyDatas.branchList : []);
  }

  showBranchInfo(int idx) async {
    final branch = branchList[idx];
    final result = await Dialogs.branchInfo(branch);
    if (result == 'edit') {
      setDataForFix(branch);
      goToPost();
    } else if (result == 'delete') {
      deleteTeacher(branch);
    }
  }

  goToPost() async {
    await Get.toNamed(Routes.branchPost);
  }

  initPostData() {
    branchModel = null;
    nameTEC.clear();
    addressTEC.clear();
    classTEC.clear();
  }

  setDataForFix(BranchModel data) {
    branchModel = data;
    nameTEC.text = data.name!;
    addressTEC.text = data.address ?? '';
    classTEC.text =
        data.classList != null ? data.classList!.length.toString() : '0';
  }

  bool get checkValid => nameTEC.text != '';

  addTeacher() {
    if (!checkValid) return false;

    final data = BranchModel(
      name: nameTEC.text,
      address: addressTEC.text,
      teachers: [],
      classList: [],
      studentCount: 0,
    );
    isPreview ? branchList.add(data) : () {};

    initPostData();
    return true;
  }

  fixTeacher() {
    if (!checkValid) return false;

    final data = BranchModel(
      name: nameTEC.text,
      address: addressTEC.text,
      teachers: List.from(branchModel!.teachers!.toList()),
      classList: List.from(branchModel!.classList!.toList()),
      studentCount: branchModel!.studentCount,
    );
    int index = branchList.indexOf(branchModel);
    isPreview ? (branchList[index] = data) : () {};

    initPostData();
    return true;
  }

  post() => isEdit ? fixTeacher() : addTeacher();

  deleteTeacher(BranchModel branch) async {
    branchList.remove(branch);
  }
}
