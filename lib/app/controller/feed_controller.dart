import 'dart:developer';

import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/ui/widgets/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  final AlbumModel _album;
  FeedController(this._album) {
    log('feedController inited!');
  }

  String get author => _album.name!;
  ImageProvider get profile => _album.profileData!;
  String get dateTime => _album.dateTime!;
  String get content => _album.content!;
  List<ImageProvider> get images => _album.imagesData!;

  final RxInt _imageIndex = 0.obs;
  int get imageIndex => _imageIndex.value;
  set imageIndex(int value) {
    if (value == indicatorStartIndex.value &&
        _imageIndex.value == indicatorStartIndex.value + 1) {
      indicatorStartIndex.value--;
      indicatorEndIndex.value--;
    } else if (value == indicatorEndIndex.value &&
        _imageIndex.value == indicatorEndIndex.value - 1) {
      indicatorStartIndex.value++;
      indicatorEndIndex.value++;
    }
    _imageIndex.value = value;
  }

  RxInt indicatorStartIndex = 0.obs;
  RxInt indicatorEndIndex = 6.obs;
}
