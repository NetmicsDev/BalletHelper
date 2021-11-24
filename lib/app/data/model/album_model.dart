import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class AlbumModel {
  int? id;
  String? name;
  String? profile;
  String? dateTime;
  String? content;
  List<String>? images;

  AlbumModel({
    this.id,
    this.name,
    this.profile,
    this.dateTime,
    this.content,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profile': profile,
      'dateTime': dateTime,
      'content': content,
      'image': images,
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      id: map['id'],
      name: map['name'],
      profile: map['profile'],
      dateTime: map['dateTime'],
      content: map['content'],
      images: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) =>
      AlbumModel.fromMap(json.decode(source));

  ImageProvider? get profileData => profile != null
      ? (profile!.contains('assets/images/')
          ? AssetImage(profile!) as ImageProvider
          : NetworkImage(profile!))
      : null;
  List<ImageProvider>? get imagesData => images != null
      ? images!
          .map<ImageProvider>((image) => image.contains('assets/images/')
              ? AssetImage(image)
              : image.contains('image_picker')
                  ? FileImage(File(image)) as ImageProvider
                  : NetworkImage(image))
          .toList()
      : null;
}
