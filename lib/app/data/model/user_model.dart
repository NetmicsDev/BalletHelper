import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class UserModel {
  int? id;
  String? name;
  String? birth;
  String? phone;
  String? profile;
  String? academyName;
  String? branchName;
  String? className;

  UserModel({
    this.id,
    this.name,
    this.birth,
    this.phone,
    this.profile,
    this.academyName,
    this.branchName,
    this.className,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birth = json['birth'];
    phone = json['phone'];
    profile = json['profile'];
    academyName = json['academyName'];
    branchName = json['branchName'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'birth': birth,
      'phone': phone,
      'profile': profile,
      'academyName': academyName,
      'branchName': branchName,
      'className': className,
    };
    return data;
  }

  ImageProvider<Object>? get profileData =>
      profile != null ? ImageUtils.pathToImage(profile!) : null;
}
