import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheet_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BottomSheets {
  static Widget select({
    required String title,
    required List<String> options,
    required Function(int) onSelect,
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
            tileColor: Colors.white,
            title: Text(option),
            onTap: () {
              Get.back();
              onSelect(index);
            },
          );
        },
      ),
    );
  }
}
