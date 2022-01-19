import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/utils/image_utils.dart';

class AlbumModel {
  String? academyId;
  String? id;
  String? name;
  String? profile;
  String? dateTime;
  String? content;
  List<String>? images;
  List<StudentModel>? students;

  AlbumModel({
    this.academyId,
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
      'academyId': academyId,
      'id': id,
      'name': name,
      'profile': profile,
      'dateTime': dateTime,
      'content': content,
      'images': images,
      'students': students?.map((x) => x.toMap()).toList(),
    };
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      academyId: map['academyId'],
      id: map['id'],
      name: map['name'],
      profile: map['profile'],
      dateTime: map['dateTime'],
      content: map['content'],
      images: List<String>.from(map['images']),
      students: map['students'] != null
          ? List<StudentModel>.from(
              map['students']?.map((x) => StudentModel.fromMap(x)))
          : null,
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

  AlbumModel copyWith({
    String? academyId,
    String? id,
    String? name,
    String? profile,
    String? dateTime,
    String? content,
    List<String>? images,
    List<StudentModel>? students,
  }) {
    return AlbumModel(
      academyId: academyId ?? this.academyId,
      id: id ?? this.id,
      name: name ?? this.name,
      profile: profile ?? this.profile,
      dateTime: dateTime ?? this.dateTime,
      content: content ?? this.content,
      images: images ?? this.images,
      students: students ?? this.students,
    );
  }

  @override
  String toString() {
    return 'AlbumModel(academyId: $academyId, id: $id, name: $name, profile: $profile, dateTime: $dateTime, content: $content, images: $images, students: $students)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AlbumModel &&
        other.academyId == academyId &&
        other.id == id &&
        other.name == name &&
        other.profile == profile &&
        other.dateTime == dateTime &&
        other.content == content &&
        listEquals(other.images, images) &&
        listEquals(other.students, students);
  }

  @override
  int get hashCode {
    return academyId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        profile.hashCode ^
        dateTime.hashCode ^
        content.hashCode ^
        images.hashCode ^
        students.hashCode;
  }
}
