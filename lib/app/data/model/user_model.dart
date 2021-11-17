import 'package:flutter/material.dart';

class UserModel {
  int? id;
  String? name;
  String? profile;
  String? academyName;
  String? branchName;
  String? className;

  UserModel({
    this.id,
    this.name,
    this.profile,
    this.academyName,
    this.branchName,
    this.className,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profile = json['profile'];
    academyName = json['academyName'];
    branchName = json['branchName'];
    className = json['className'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'profile': profile,
      'academyName': academyName,
      'branchName': branchName,
      'className': className,
    };
    return data;
  }

  Object? get profileData => profile != null
      ? (profile!.contains('assets/images/')
          ? AssetImage(profile!)
          : NetworkImage(profile!))
      : null;
}
