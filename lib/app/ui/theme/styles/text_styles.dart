import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:flutter/cupertino.dart';

class TextStyles {
  static const headlineStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  static const buttonDarkTitleStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const buttonBrightTitleStyle = TextStyle(
    color: AppColors.brightTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const buttonDarkContentStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 14,
  );
  static const buttonBrightContentStyle = TextStyle(
    color: AppColors.brightTextColor,
    fontSize: 15,
  );

  static const bottomSheetTitleStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const academyNameStyle = TextStyle(
    color: AppColors.subtitleColor,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static const brightContentStyle = TextStyle(
    color: AppColors.brightTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const menuButtonStyle = TextStyle(
    color: AppColors.brightTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    textBaseline: TextBaseline.alphabetic,
  );
}
