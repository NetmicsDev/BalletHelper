import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class ImageModel {
  String? academyId;
  String? uri;

  ImageModel({this.academyId, this.uri});

  ImageModel.fromJson(Map<String, dynamic> json) {
    academyId = json['academyId'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'academyId': academyId,
      'uri': uri,
    };
    return data;
  }

  Object? get imageData => uri != null ? ImageUtils.pathToImage(uri!) : null;
}
