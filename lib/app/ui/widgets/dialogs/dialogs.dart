import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialog_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Dialogs {
  static alert({String? title, String? content}) {
    final titleWidget = title != null
        ? Center(
            child: Text(
              title,
              style: TextStyles.bottomSheetTitleStyle,
            ),
          )
        : null;
    final contentWidget = content != null
        ? Text(
            content,
            textAlign: TextAlign.center,
          )
        : null;
    return DialogWrapper(
      title: titleWidget,
      content: contentWidget,
      actions: [
        DialogActionButton(
          color: AppColors.primaryColor,
          title: '확인',
          titleColor: Colors.white,
          onPressed: () {
            Get.back();
          },
        )
      ],
    );
  }

  static confirm({String? title, String? content}) {
    final titleWidget = title != null
        ? Center(
            child: Text(
              title,
              style: TextStyles.bottomSheetTitleStyle,
            ),
          )
        : null;
    final contentWidget = content != null
        ? Text(
            content,
            textAlign: TextAlign.center,
          )
        : null;
    return DialogWrapper(
      title: titleWidget,
      content: contentWidget,
      actions: [
        DialogActionButton(
          title: '취소',
          titleColor: AppColors.primaryColor,
          onPressed: () {
            Get.back(result: false);
          },
        ),
        const SizedBox(width: 10),
        DialogActionButton(
          color: AppColors.primaryColor,
          title: '확인',
          titleColor: Colors.white,
          onPressed: () {
            Get.back(result: true);
          },
        )
      ],
    );
  }
}
