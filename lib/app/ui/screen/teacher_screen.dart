import 'package:ballet_helper/app/controller/teacher_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherScreen extends GetView<TeacherController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('교사 관리'),
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
                        '직책',
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
                      itemCount: controller.teacherList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final teacher = controller.teacherList[index];
                        final String branchText = teacher.branchName!.isNotEmpty
                            ? teacher.branchName![0]
                            : '미정';
                        return SizedBox(
                          height: 40,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => controller.showTeacherInfo(index),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      teacher.name!,
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      branchText,
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      teacher.position!,
                                      textAlign: TextAlign.center,
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              DialogActionButton(
                title: '교사 추가',
                color: AppColors.primaryColor,
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
