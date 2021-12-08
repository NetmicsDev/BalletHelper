import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

// 원장 & 선생
class UserModel {
  int? id;
  String? name;
  String? birth;
  String? phone;
  String? email;
  String? profile;
  List<String>? branchName;
  List<String>? className;
  String? position;

  UserModel({
    this.id,
    this.name,
    this.birth,
    this.phone,
    this.email,
    this.profile,
    this.branchName,
    this.className,
    this.position,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birth = json['birth'];
    phone = json['phone'];
    email = json['email'];
    profile = json['profile'];
    branchName = json['branchName'] is String
        ? [json['branchName']]
        : json['branchName'];
    className = json['className'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'birth': birth,
      'phone': phone,
      'email': email,
      'profile': profile,
      'branchName': branchName!.length == 1 ? branchName![0] : branchName,
      'className': className,
      'position': position,
    };
    return data;
  }

  ImageProvider<Object>? get profileData =>
      profile != null ? ImageUtils.pathToImage(profile!) : null;
}
