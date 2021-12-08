import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheet_add.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheet_wrapper.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/option_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BottomSheets {
  static Future<T?> select<T>({
    String? title,
    required List<String> options,
    Widget Function(BuildContext, int)? itemBuilder,
  }) {
    return Get.bottomSheet(BotttomSheetWrapper(
      title: title,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: options.length,
        itemBuilder: itemBuilder ??
            (context, index) {
              String option = options[index];
              return ListTile(
                title: Text(option),
                onTap: () {
                  Get.back(result: index);
                },
              );
            },
      ),
    ));
  }

  static Future<List<T>?> add<T>({
    required String title,
    required List<T> options,
    required List<T> selectedList,
    Widget Function(T)? itemBuilder,
    Widget Function(T)? leadingBuilder,
  }) {
    return Get.bottomSheet(BottomSheetAdd(
      title: title,
      options: options,
      selectedList: selectedList,
      itemBuilder: itemBuilder ??
          (T item) => Text(
                item.toString(),
                style: TextStyles.authorStyle,
              ),
      leadingBuilder: leadingBuilder,
    ));
  }
}
