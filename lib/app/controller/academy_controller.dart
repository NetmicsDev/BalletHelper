import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/branch_model.dart';
import 'package:ballet_helper/app/data/provider/branch_provider.dart';
import 'package:ballet_helper/app/data/repository/academy_repository.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheets.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcademyController extends GetxController {
  final _repository = AcademyRepository(Get.find<BranchProvider>());

  final _mainController = Get.find<HomeController>();
  bool get isPreview => _mainController.isPreview;

  final branchList = <BranchModel>[].obs;

  bool get isEdit => branchModel != null;

  BranchModel? branchModel;
  final nameTEC = TextEditingController();
  final addressTEC = TextEditingController();
  final classList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBranchList();
  }

  @override
  void onClose() {
    nameTEC.dispose();
    addressTEC.dispose();
    super.onClose();
  }

  getBranchList() async {
    branchList.addAll(isPreview
        ? DummyDatas.branchList
        : (await _repository.getBranchList()));
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
    classList.clear();
  }

  setDataForFix(BranchModel data) {
    branchModel = data;
    nameTEC.text = data.name!;
    addressTEC.text = data.address ?? '';
    classList.addAll(data.classList!);
  }

  bool get checkValid => nameTEC.text != '';

  addTeacher() {
    if (!checkValid) return false;

    final data = BranchModel(
      name: nameTEC.text,
      address: addressTEC.text,
      teachers: [],
      classList: List.from(classList),
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
      classList: List.from(classList),
      studentCount: branchModel!.studentCount,
    );
    int index = branchList.indexOf(branchModel);
    isPreview ? (branchList[index] = data) : () {};

    initPostData();
    return true;
  }

  post() => isEdit ? fixTeacher() : addTeacher();

  showClassCreateSheet() async {
    final result =
        await BottomSheets.create(title: '반 생성', selectedList: classList);
    if (result != null) {
      classList.clear();
      result.sort((s1, s2) => s1.compareTo(s2));
      classList.addAll(result);
    }
  }

  deleteTeacher(BranchModel branch) async {
    branchList.remove(branch);
  }
}
