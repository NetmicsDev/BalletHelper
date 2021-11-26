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
                  itemBuilder: (context, index) =>
                      buildItem(widget.students[index]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Obx(() => DialogActionButton(
                        title: '추가(${selectedList.length})',
                        onPressed: () {
                          Get.back(result: selectedList);
                        },
                        color: AppColors.primaryColor,
                        titleColor: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItem(StudentModel student) {
    return Obx(() {
      final bool isSelected = selectedList.contains(student);
      return Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.3)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: student.profileData,
          ),
          title: Text(
            student.name!,
            style: TextStyles.authorStyle,
          ),
          trailing: isSelected
              ? Material(
                  elevation: 0,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(width: 12, height: 12),
                )
              : null,
          onTap: () {
            isSelected
                ? selectedList.remove(student)
                : selectedList.add(student);
          },
        ),
      );
    });
  }
}
