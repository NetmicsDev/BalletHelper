import 'package:ballet_helper/app/controller/family_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyScreen extends GetView<FamilyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('가족 관리'),
          elevation: 0,
        ),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: controller.familyList.length,
                itemBuilder: (context, index) {
                  final familyData = controller.familyList[index];
                  return SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              familyData['phone'],
                              textAlign: TextAlign.center,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              familyData['relation'],
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  );
                },
              )),
              DialogActionButton(
                title: '가족 초대',
                color: AppColors.primaryColor,
                titleColor: Colors.white,
                onPressed: controller.invite,
              ),
            ],
          ),
        )));
  }
}
