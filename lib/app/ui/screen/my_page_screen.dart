import 'dart:developer';

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image(
                                      image: controller.userData.profileData!),
                                ),
                              )
                            ],
                          ),
                        ),
                        Text(
                          controller.userData.name!,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          controller.birth,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              controller.branchName,
                              textAlign: TextAlign.center,
                            )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  controller.className,
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
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
                                onChanged: (value) =>
                                    controller.relation = value ?? '어머니',
                              )),
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
}
