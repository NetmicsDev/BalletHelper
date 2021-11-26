import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class ImageModel {
  int? id;
  String? uri;

  ImageModel({this.id, this.uri});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uri = json['uri'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'uri': uri,
    };
    return data;
  }

  Object? get imageData => uri != null ? ImageUtils.pathToImage(uri!) : null;
}
