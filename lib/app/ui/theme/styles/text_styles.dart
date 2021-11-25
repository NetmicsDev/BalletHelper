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
    color: AppColors.primaryDarkColor,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );
  static const brightContentStyle = TextStyle(
    color: AppColors.brightTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const buttonMenuStyle = TextStyle(
    color: AppColors.brightTextColor,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    textBaseline: TextBaseline.alphabetic,
  );

  static const authorStyle = TextStyle(
    color: AppColors.titleColor,
    fontSize: 16,
    // fontWeight: FontWeight.bold,
  );

  static const dateTimeStyle = TextStyle(
    color: AppColors.subtitleColor,
    fontSize: 13,
  );

  static const buttonNavigateStyle = TextStyle(
    color: AppColors.primaryDarkColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const buttonActionStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    letterSpacing: 2,
  );

  static const chipDarkStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
  static const chipBrightStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.brightTextColor,
  );
}
