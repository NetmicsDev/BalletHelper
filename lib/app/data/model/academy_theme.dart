import 'dart:convert';
import 'dart:ui';

import 'package:ballet_helper/app/ui/theme/colors.dart';

class AcademyTheme {
  Color primary;
  Color primaryDark;
  Color primaryLight;
  Color secondary;
  Color background;

  AcademyTheme({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.secondary,
    required this.background,
  });

  AcademyTheme copyWith({
    Color? primary,
    Color? primaryDark,
    Color? primaryLight,
    Color? secondary,
    Color? background,
  }) {
    return AcademyTheme(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primary': primary.value,
      'primaryDark': primaryDark.value,
      'primaryLight': primaryLight.value,
      'secondary': secondary.value,
      'background': background.value,
    };
  }

  factory AcademyTheme.fromMap(Map<String, dynamic> map) {
    return AcademyTheme(
      primary: Color(map['primary'] ?? AppColors.primaryColor.value),
      primaryDark:
          Color(map['primaryDark'] ?? AppColors.primaryDarkColor.value),
      primaryLight:
          Color(map['primaryLight'] ?? AppColors.secondaryColor.value),
      secondary: Color(map['secondary'] ?? AppColors.secondaryColor.value),
      background:
          Color(map['background'] ?? AppColors.scaffoldBackgroundColor.value),
    );
  }

  String toJson() => json.encode(toMap());

  factory AcademyTheme.fromJson(String source) =>
      AcademyTheme.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AcademyTheme(primary: $primary, primaryDark: $primaryDark, primaryLight: $primaryLight, secondary: $secondary, background: $background)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AcademyTheme &&
        other.primary == primary &&
        other.primaryDark == primaryDark &&
        other.primaryLight == primaryLight &&
        other.secondary == secondary &&
        other.background == background;
  }

  @override
  int get hashCode {
    return primary.hashCode ^
        primaryDark.hashCode ^
        primaryLight.hashCode ^
        secondary.hashCode ^
        background.hashCode;
  }
}
