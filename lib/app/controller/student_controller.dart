import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final _mainController = Get.find<HomeController>();
  bool get isPreview => _mainController.isPreview;

  final _studentList = <StudentModel>[].obs;
  List<StudentModel> get studentList => _studentList;
  List<String> get branchList => _mainController.userData.branchName;
  List<String> get classList => _mainController.userData.className;

  bool get isEdit => studentModel != null;

  final _selectedBranch = ''.obs;
  get selectedBranch => _selectedBranch.value;
  set selectedBranch(value) => _selectedBranch.value = value;
  final _selectedClass = ''.obs;
  get selectedClass => _selectedClass.value;
  set selectedClass(value) => _selectedClass.value = value;

  StudentModel? studentModel;
  final nameTEC = TextEditingController();
  final birthTEC = TextEditingController();
  final phoneTEC = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getStudentList();
  }

  @override
  onClose() {
    nameTEC.dispose();
    birthTEC.dispose();
    phoneTEC.dispose();
    super.onClose();
  }

  getStudentList() async {
    final result = isPreview ? DummyDatas.studentList : <StudentModel>[];
    _studentList.addAll(result);
  }

  showStudentInfo(int idx) async {
    final result = await Dialogs.studentInfo(studentList[idx]);
    if (result == 'edit') {
      setDataForFix(studentList[idx]);
      goToPost();
    } else if (result == 'delete') {
      deleteStudent(studentList[idx]);
    }
  }

  goToPost() async {
    await Get.toNamed(Routes.studentPost);
  }

  initPostData() {
    studentModel = null;
    nameTEC.clear();
    birthTEC.clear();
    phoneTEC.clear();
  }

  setDataForAdd() {
    selectedBranch = branchList[0];
    selectedClass = classList[0];
  }

  setDataForFix(StudentModel data) {
    studentModel = data;
    nameTEC.text = data.name!;
    birthTEC.text = data.birth ?? '';
    phoneTEC.text = data.phone ?? '';
    selectedBranch = data.branchName;
    selectedClass = data.className;
  }

  addStudent() {
    final name = nameTEC.text;
    if (name == '') {
      return false;
    }
    final data = StudentModel(
      name: nameTEC.text,
      birth: birthTEC.text,
      phone: phoneTEC.text,
      branchName: selectedBranch,
      className: selectedClass,
    );
    isPreview ? studentList.add(data) : () {};

    initPostData();
    return true;
  }

  fixStudent() {
    final name = nameTEC.text;
    if (name == '') {
      return false;
    }
    final data = StudentModel(
      name: nameTEC.text,
      profile: studentModel?.profile,
      birth: birthTEC.text,
      phone: phoneTEC.text,
      branchName: selectedBranch,
      className: selectedClass,
    );
    int index = _studentList.indexOf(studentModel);
    isPreview ? (_studentList[index] = data) : () {};

    initPostData();
    return true;
  }

  post() => isEdit ? fixStudent() : addStudent();

  deleteStudent(StudentModel student) async {
    studentList.remove(student);
  }
}
