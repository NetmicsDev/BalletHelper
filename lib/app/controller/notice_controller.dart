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

  NoticeModel? noticeModel;
  final titleInputController = TextEditingController();
  final contentInputController = TextEditingController();

  initPostData() {
    noticeModel = null;
    titleInputController.clear();
    contentInputController.clear();
  }

  setDataForFix(NoticeModel data) {
    noticeModel = data;
    titleInputController.text = data.title!;
    contentInputController.text = data.content!;
  }

  bool post() => noticeModel != null ? fixNotice() : addNotice();

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

    initPostData();
    return true;
  }

  fixNotice() {
    final title = titleInputController.text;
    final content = contentInputController.text;
    if (title == '' || content == '') {
      return false;
    }
    final data = NoticeModel(
      id: noticeModel!.id,
      name: noticeModel!.name,
      profile: noticeModel!.profile,
      dateTime: noticeModel!.dateTime,
      title: titleInputController.text,
      content: contentInputController.text,
    );
    int index = noticeList.indexOf(noticeModel);
    isPreview ? (noticeList[index] = data) : () {};

    initPostData();
    return true;
  }

  deleteNotice(NoticeModel notice) {
    noticeList.remove(notice);
  }

  getDummyNoticeData() {
    return DummyDatas.noticeList;
  }

  getNoticeData() {
    return [];
  }
}
