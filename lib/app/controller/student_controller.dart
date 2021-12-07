import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final bool isPreview = Get.find<MainController>().isPreview;
  final _studentList = <StudentModel>[].obs;
  List<StudentModel> get studentList => _studentList;

  @override
  void onInit() {
    super.onInit();
    getStudentList();
  }

  getStudentList() async {
    final result = isPreview ? DummyDatas.studentList : <StudentModel>[];
    _studentList.addAll(result);
  }

  showStudentInfo(int idx) async {
    await Dialogs.studentInfo(studentList[idx]);
  }

  addStudent() async {}
}
