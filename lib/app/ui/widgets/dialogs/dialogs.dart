import 'package:ballet_helper/app/data/model/branch_model.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/branch_info_dialog.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialog_wrapper.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/student_info_dialog.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/teacher_info_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Dialogs {
  static Future<T?> alert<T>({String? title, String? content}) {
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
    return Get.dialog<T>(DialogWrapper(
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
    ));
  }

  static Future<T?> confirm<T>({String? title, String? content}) {
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
    return Get.dialog<T>(DialogWrapper(
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
        DialogActionButton(
          color: AppColors.primaryColor,
          title: '확인',
          titleColor: Colors.white,
          onPressed: () {
            Get.back(result: true);
          },
        )
      ],
    ));
  }

  static Future<T?> studentInfo<T>(StudentModel student) {
    return Get.dialog<T>(StudentInfoDialog(student: student));
  }

  static Future<T?> teacherInfo<T>(UserModel teacher) {
    return Get.dialog<T>(TeacherInfoDialog(teacher: teacher));
  }

  static Future<T?> branchInfo<T>(BranchModel branch) {
    return Get.dialog<T>(BranchInfoDialog(branch: branch));
  }
}
