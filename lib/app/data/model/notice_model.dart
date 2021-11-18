import 'dart:convert';

import 'package:flutter/material.dart';

class NoticeModel {
  int? id;
  String? name;
  String? profile;
  String? dateTime;
  String? title;
  String? content;
  String? image;

  NoticeModel({
    this.id,
    this.name,
    this.profile,
    this.dateTime,
    this.title,
    this.content,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profile': profile,
      'dateTime': dateTime,
      'title': title,
      'content': content,
      'image': image,
    };
  }

  factory NoticeModel.fromMap(Map<String, dynamic> map) {
    return NoticeModel(
      id: map['id'],
      name: map['name'],
      profile: map['profile'],
      dateTime: map['dateTime'],
      title: map['title'],
      content: map['content'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NoticeModel.fromJson(String source) =>
      NoticeModel.fromMap(json.decode(source));

  Object? get profileData => profile != null
      ? (profile!.contains('assets/images/')
          ? AssetImage(profile!)
          : NetworkImage(profile!))
      : null;
  Object? get imageData => image != null
      ? (image!.contains('assets/images/')
          ? AssetImage(image!)
          : NetworkImage(image!))
      : null;
}
