import 'dart:convert';

import 'package:ballet_helper/app/utils/image_utils.dart';

class StudentModel {
  String? id;
  String? name;
  String? profile;
  String? academyName;
  String? branchName;
  String? className;

  StudentModel({
    this.id,
    this.name,
    this.profile,
    this.academyName,
    this.branchName,
    this.className,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profile': profile,
      'academyName': academyName,
      'branchName': branchName,
      'className': className,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      profile: map['profile'],
      academyName: map['academyName'],
      branchName: map['branchName'],
      className: map['className'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  Object? get profileData =>
      profile != null ? ImageUtils.pathToImage(profile) : null;
}
