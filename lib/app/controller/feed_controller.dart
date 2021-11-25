import 'dart:developer';

import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/widgets/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  AlbumModel _album;
  FeedController(this._album) {
    log('feedController inited!');
  }
  setData(AlbumModel album) {
    if (_album != album) {
      log('feedController ${_album.id} refresh!');
      _album = album;
      refresh();
    }
  }

  String get id => _album.id!;
  String get author => _album.name!;
  ImageProvider get profile => _album.profileData!;
  String get dateTime => _album.dateTime!;
  String get content => _album.content!;
  List<ImageProvider> get images => _album.imagesData!;

  bool get isMine =>
      author.split(' ')[0] == Get.find<MainController>().userName.split(' ')[0];

  final RxInt _imageIndex = 0.obs;
  int get imageIndex => _imageIndex.value;
  set imageIndex(int value) {
    if (value != 0 &&
        value == indicatorStartIndex.value &&
        _imageIndex.value == indicatorStartIndex.value + 1 &&
        images.length > 7) {
      indicatorStartIndex.value--;
      indicatorEndIndex.value--;
    } else if (value != images.length - 1 &&
        value == indicatorEndIndex.value &&
        _imageIndex.value == indicatorEndIndex.value - 1 &&
        images.length > 7) {
      indicatorStartIndex.value++;
      indicatorEndIndex.value++;
    }
    _imageIndex.value = value;
  }

  RxInt indicatorStartIndex = 0.obs;
  RxInt indicatorEndIndex = 6.obs;

  fix() {
    Get.find<AlbumController>().setDataForFix(_album);
    Get.toNamed(Routes.albumPost);
  }

  delete() {
    Get.find<AlbumController>().deleteAlbum(_album);
  }
}
