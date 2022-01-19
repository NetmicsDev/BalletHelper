import 'dart:developer';

import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/academy_model.dart';
import 'package:ballet_helper/app/data/model/academy_theme.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'login_controller.dart';

class AppController extends GetxController {
  AppController({bool? isPreview, UserType? userType}) {
    this.isPreview = isPreview ?? false;
    this.userType = userType ??
        (storageData['userType'] == 'teacher'
            ? UserType.owner
            : UserType.parent);
    log('${this.isPreview} ${this.userType}');
  }
  late final bool isPreview;
  late final UserType userType;

  final storageData = GetStorage().read('login');
  final RxList<AcademyModel> academyList = <AcademyModel>[].obs;
  final RxInt _selectedIndex = (-1).obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(value) => _selectedIndex.value = value;
  AcademyModel? get selectedAcademy =>
      selectedIndex == -1 ? null : academyList[selectedIndex];

  @override
  void onInit() {
    super.onInit();
    isPreview ? getDummyAcademysData() : getAcademysData();
  }

  getAcademysData() async {}

  getDummyAcademysData() async {
    academyList.addAll(DummyDatas.academyList);
  }

  goToHome(int index) async {
    AppColors.current = academyList[index].theme;
    await Get.toNamed(Routes.home, parameters: {
      'preview': isPreview ? '1' : '0',
      'type': userTypeToString(userType),
      'academy': academyList[index].id,
    });
    AppColors.current = AcademyTheme.fromMap({});
  }
}
