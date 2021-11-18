import 'dart:developer';

import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:get/get.dart';

class AlbumController extends GetxController {
  bool isPreview = Get.find<MainController>().isPreview;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<AlbumModel> get albumList =>
      isPreview ? getDummyAlbumData() : getAlbumData();

  getDummyAlbumData() {
    return DummyDatas.albumList;
  }

  getAlbumData() {
    return [];
  }
}
