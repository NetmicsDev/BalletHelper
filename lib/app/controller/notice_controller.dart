import 'dart:developer';

import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoticeController extends GetxController {
  final mainController = Get.find<MainController>();
  bool get isPreview => mainController.isPreview;

  @override
  void onInit() {
    super.onInit();
    noticeList.addAll(isPreview ? getDummyNoticeData() : getNoticeData());
    selectedBranch.value = mainController.userData.branchName!;
  }

  @override
  void onClose() {
    super.onClose();
  }

  final RxList<NoticeModel> noticeList = <NoticeModel>[].obs;
  final RxString selectedBranch = ''.obs;

  addNotice({required String title, required String content}) {
    final data = NoticeModel(
      name: mainController.userData.name,
      profile: mainController.userData.profile,
      dateTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      title: title,
      content: content,
    );
    isPreview ? noticeList.insert(0, data) : () {};
  }

  getDummyNoticeData() {
    return DummyDatas.noticeList;
  }

  getNoticeData() {
    return [];
  }
}
