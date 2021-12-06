import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';

class ParentModel {
  int? id;
  String? name;
  String? phone;
  String? email;
  StudentModel? student;

  ParentModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.student,
  });

  ParentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    student = StudentModel.fromJson(json['student']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
      'email': email,
      'student': student
    };
    return data;
  }

  ImageProvider<Object>? get profileData => student?.profile != null
      ? ImageUtils.pathToImage(student!.profile!)
      : null;
}
