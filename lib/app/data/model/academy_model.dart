import 'dart:convert';

import 'package:ballet_helper/app/data/model/academy_theme.dart';
import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/cupertino.dart';

class AcademyModel {
  String id;
  String name;
  String content;
  String imageUrl;
  AcademyTheme theme;

  AcademyModel({
    required this.id,
    required this.name,
    required this.content,
    required this.imageUrl,
    required this.theme,
  });

  AcademyModel copyWith({
    String? id,
    String? name,
    String? content,
    String? imageUrl,
    AcademyTheme? theme,
  }) {
    return AcademyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      theme: theme ?? this.theme,
    );
  }

  ImageProvider? get image => ImageUtils.pathToImage(imageUrl);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'imageUrl': imageUrl,
      'theme': theme.toMap(),
    };
  }

  factory AcademyModel.fromMap(Map<String, dynamic> map) {
    return AcademyModel(
      id: map['id']?.toInt(),
      name: map['name'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      theme: AcademyTheme.fromMap(map['theme']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AcademyModel.fromJson(String source) =>
      AcademyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AcademyModel(id: $id, name: $name, content: $content, imageUrl: $imageUrl, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcademyModel &&
        other.id == id &&
        other.name == name &&
        other.content == content &&
        other.imageUrl == imageUrl &&
        other.theme == theme;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        content.hashCode ^
        imageUrl.hashCode ^
        theme.hashCode;
  }
}
