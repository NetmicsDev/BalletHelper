import 'dart:developer';

import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

import 'bottom_sheet_wrapper.dart';

class BottomSheetStudent extends StatefulWidget {
  final String title;
  final List<StudentModel> students;
  final List<StudentModel> selectedList;

  const BottomSheetStudent({
    Key? key,
    required this.title,
    required this.students,
    required this.selectedList,
  }) : super(key: key);

  @override
  _BottomSheetStudentState createState() => _BottomSheetStudentState();
}

class _BottomSheetStudentState extends State<BottomSheetStudent> {
  final List<StudentModel> selectedList = <StudentModel>[].obs;

  @override
  void initState() {
    super.initState();
    selectedList.addAll(widget.selectedList);
  }

  @override
  Widget build(BuildContext context) {
    return BotttomSheetWrapper(
      title: widget.title,
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thickness: 3,
                radius: const Radius.circular(3),
                isAlwaysShown: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.students.length,
                  itemBuilder: (context, index) {
                    final student = widget.students[index];
                    return Obx(() {
                      final bool isSelected = selectedList.contains(student);
                      return Container(
                        color:
                            isSelected ? AppColors.primaryColor : Colors.white,
                        child: ListTile(
                          tileColor: Colors.amber,
                          title: Text(
                            student.name!,
                            style: TextStyles.buttonDarkTitleStyle.copyWith(
                                color:
                                    isSelected ? Colors.white : Colors.black),
                          ),
                          onTap: () {
                            isSelected
                                ? selectedList.remove(student)
                                : selectedList.add(student);
                          },
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  DialogActionButton(
                    title: '추가',
                    onPressed: () {
                      Get.back(result: selectedList);
                    },
                    color: AppColors.primaryColor,
                    titleColor: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
