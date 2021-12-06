import 'dart:convert';

import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/cupertino.dart';

class StudentModel {
  String? id;
  String? name;
  String? birth;
  String? phone;
  String? profile;
  String? branchName;
  String? className;

  StudentModel({
    this.id,
    this.name,
    this.birth,
    this.phone,
    this.profile,
    this.branchName,
    this.className,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birth': birth,
      'phone': phone,
      'profile': profile,
      'branchName': branchName,
      'className': className,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      birth: map['birth'],
      phone: map['phone'],
      profile: map['profile'],
      branchName: map['branchName'],
      className: map['className'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  ImageProvider<Object>? get profileData =>
      profile != null ? ImageUtils.pathToImage(profile!) : null;
}
