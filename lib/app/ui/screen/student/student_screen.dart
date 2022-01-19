import 'package:ballet_helper/app/controller/student_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentScreen extends GetView<StudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('원생 관리'),
          backgroundColor: AppColors.current.primary,
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(
                        '이름',
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '지점',
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '반',
                        textAlign: TextAlign.center,
                      )),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Expanded(
                  child: Obx(() => ListView.builder(
                        itemCount: controller.studentList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final student = controller.studentList[index];
                          return SizedBox(
                            height: 40,
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () => controller.showStudentInfo(index),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        student.name!,
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        student.branchName!,
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        student.className!,
                                        textAlign: TextAlign.center,
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                      ))),
              DialogActionButton(
                title: '원아 추가',
                color: AppColors.current.primary,
                titleColor: Colors.white,
                onPressed: () {
                  controller.setDataForAdd();
                  controller.goToPost();
                },
              )
            ],
          ),
        )));
  }
}
