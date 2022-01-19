import 'package:ballet_helper/app/controller/academy_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcademyScreen extends GetView<AcademyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('학원 관리'),
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
                        '지점',
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '담당자',
                        textAlign: TextAlign.center,
                      )),
                  Expanded(
                      flex: 1,
                      child: Text(
                        '원생 수',
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
                      itemCount: controller.branchList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final branch = controller.branchList[index];
                        return SizedBox(
                          height: 40,
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => controller.showBranchInfo(index),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      branch.name!,
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      branch.represent.name!,
                                      textAlign: TextAlign.center,
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Text(
                                      branch.studentCount.toString(),
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
                title: '지점 추가',
                color: AppColors.current.primary,
                titleColor: Colors.white,
                onPressed: controller.goToPost,
              )
            ],
          ),
        )));
  }
}
