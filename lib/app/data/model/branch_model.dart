import 'dart:convert';

import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class BranchModel {
  int? id;
  String? name;
  String? address;
  List<UserModel>? teachers;
  List<String>? classList;
  int? studentCount;

  BranchModel({
    this.id,
    this.name,
    this.address,
    this.teachers,
    this.classList,
    this.studentCount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'teachers': teachers,
      'classList': classList,
      'studentCount': studentCount,
    };
  }

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      id: map['id'],
      name: map['name'],
      address: map['address'],
      teachers: [UserModel.fromJson(map['manager'] ?? {})],
      classList: map['classList'],
      studentCount: map['studentCount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BranchModel.fromJson(String source) =>
      BranchModel.fromMap(json.decode(source));

  UserModel get represent =>
      teachers!.firstWhere((element) => element.position == '관리자',
          orElse: () => teachers![0]);
}
