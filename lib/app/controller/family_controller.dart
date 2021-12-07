import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/parent_model.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class FamilyController extends GetxController {
  List<Map<String, dynamic>> get familyList =>
      Get.find<MainController>().isPreview
          ? DummyDatas.familyList
          : getFamilyList();

  getFamilyList() {
    return [];
  }

  invite() async {
    final parentData = Get.find<MainController>().userData as ParentModel;
    await Share.share('[학원 이름]\n'
        '${parentData.student!.name}의 학원 생활을 지켜보세요!\n'
        '=> 링크를 통해 앱을 설치한 후 회원가입 화면에서 초대코드를 입력해주세요!\n'
        '(초대코드: TESTCODE)');
  }
}
