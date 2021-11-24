import 'dart:developer';

import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NoticeController extends GetxController {
  final mainController = Get.find<MainController>();
  bool get isPreview => mainController.isPreview;

  @override
  void onInit() {
    super.onInit();
    noticeList.addAll(isPreview ? getDummyNoticeData() : getNoticeData());
  }

  @override
  void onClose() {
    super.onClose();
  }

  final RxList<NoticeModel> noticeList = <NoticeModel>[].obs;
  String get selectedBranch =>
      '${mainController.userData.branchName} ${mainController.userData.className}';
  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

  addNotice() {
    final title = titleInputController.text;
    final content = contentInputController.text;
    if (title == '' || content == '') {
      return false;
    }
    final data = NoticeModel(
      name: mainController.userData.name,
      profile: mainController.userData.profile,
      dateTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      title: titleInputController.text,
      content: contentInputController.text,
    );
    isPreview ? noticeList.insert(0, data) : () {};
    titleInputController.clear();
    contentInputController.clear();
    return true;
  }

  getDummyNoticeData() {
    return DummyDatas.noticeList;
  }

  getNoticeData() {
    return [];
  }
}
