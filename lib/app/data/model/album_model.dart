import 'dart:convert';
import 'dart:io';

import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class AlbumModel {
  String? id;
  String? name;
  String? profile;
  String? dateTime;
  String? content;
  List<String>? images;
  List<StudentModel>? students;

  AlbumModel({
    this.id,
    this.name,
    this.profile,
    this.dateTime,
    this.content,
    this.images,
    this.students,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profile': profile,
      'dateTime': dateTime,
      'content': content,
      'images': images,
      'students': students,
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
      students: map['students'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) =>
      AlbumModel.fromMap(json.decode(source));

  ImageProvider? get profileData =>
      profile != null ? ImageUtils.pathToImage(profile!) : null;
  List<ImageProvider>? get imagesData => images != null
      ? images!
          .map<ImageProvider>((image) => ImageUtils.pathToImage(image))
          .toList()
      : null;
}
