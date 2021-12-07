import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/my_page_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyPageScreen extends GetView<MyPageController> {
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        elevation: 0,
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => Get.focusScope?.unfocus(),
              child: Container(
                height: height - Get.statusBarHeight - 20,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        flex: 3,
                        child: controller.userType == UserType.parent
                            ? buildParentInfo()
                            : controller.userType == UserType.teacher
                                ? buildTeacherInfo()
                                : buildOwnerInfo()),
                    SizedBox(height: 30),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '이메일',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                controller.userData.email,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '연락처',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                width: 160,
                                child: TextField(
                                  controller: controller.phoneTEC,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DialogActionButton(
                                title: '정보 수정',
                                titleColor: Colors.white,
                                color: AppColors.primaryColor,
                                onPressed: controller.edit,
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildParentInfo() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              height: 120,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primaryColor, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image(
                          image: controller.userData.profileData!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                controller.userData.name!,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              controller.birth,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.branchName,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    controller.className,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '가족 관계',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 160,
              child: Obx(() => DropdownButton<String>(
                    value: controller.relation,
                    isExpanded: true,
                    items: [
                      '어머니',
                      '아버지',
                      '할아버지',
                      '할머니',
                    ]
                        .map((e) => DropdownMenuItem<String>(
                            value: e,
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                            )))
                        .toList(),
                    onChanged: (value) => controller.relation = value ?? '어머니',
                  )),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTeacherInfo() {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.hardEdge,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image(
                image: controller.userData.profileData!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            controller.userData.name!,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.branchName![0],
                textAlign: TextAlign.center,
              ),
              const SizedBox(width: 20),
              Container(
                width: 160,
                child: Obx(() => DropdownButton<String>(
                      value: controller.selectedClass,
                      isExpanded: true,
                      items: (controller.className as List<String>)
                          .map((e) => DropdownMenuItem<String>(
                              value: e,
                              alignment: Alignment.center,
                              child: Text(
                                e,
                                textAlign: TextAlign.center,
                              )))
                          .toList(),
                      onChanged: (value) =>
                          controller.selectedClass = value ?? 'A반',
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOwnerInfo() {
    return SizedBox();
  }
}
