import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheet_student.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheet_wrapper.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/option_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BottomSheets {
  static select({
    String? title,
    required List<String> options,
  }) {
    return BotttomSheetWrapper(
      title: title,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: options.length,
        itemBuilder: (context, index) {
          String option = options[index];
          return ListTile(
            title: Text(option),
            onTap: () {
              Get.back(result: index);
            },
          );
        },
      ),
    );
  }

  static add<T>({
    required String title,
    required List<T> options,
    required List<T> selectedList,
  }) {
    if (T == StudentModel) {
      (options as List<StudentModel>)
          .sort((s1, s2) => s1.name!.compareTo(s2.name!));
      return BottomSheetStudent(
        title: title,
        students: options as List<StudentModel>,
        selectedList: selectedList as List<StudentModel>,
      );
    } else {
      return null;
    }
  }
}
