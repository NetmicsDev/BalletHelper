import 'package:ballet_helper/app/controller/teacher_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherPostScreen extends GetView<TeacherController> {
  cancel() async {
    final result = await Dialogs.confirm(
      title: '작성 취소',
      content: '작성 중인 내용이 모두 사라집니다. 정말 취소하시겠습니까?',
    );
    if (result ?? false) {
      controller.initPostData();
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        cancel();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 50,
          title: Text(
            controller.isEdit ? '교사 정보 수정' : '교사 추가',
            style: TextStyles.buttonBrightTitleStyle,
          ),
          actions: [IconButton(onPressed: cancel, icon: Icon(Icons.close))],
          centerTitle: true,
        ),
        body: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Get.focusScope?.unfocus(),
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height - Get.statusBarHeight,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTextField(
                      controller: controller.nameTEC,
                      labelText: '이름',
                      isRequired: true,
                    ),
                    SizedBox(height: 20),
                    buildTextField(
                        controller: controller.phoneTEC, labelText: '연락처'),
                    SizedBox(height: 20),
                    Obx(() {
                      controller.branchTEC.text =
                          controller.selectedBranch.toString();
                      return buildTextField(
                          controller: controller.branchTEC,
                          labelText: '지점',
                          isRequired: true,
                          onSelect: () {});
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      controller.classTEC.text =
                          controller.selectedClass.toString();
                      return buildTextField(
                          controller: controller.classTEC,
                          labelText: '반',
                          isRequired: true,
                          onSelect: () {});
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      controller.positionTEC.text =
                          controller.selectedPosition.toString();
                      return buildTextField(
                          controller: controller.positionTEC,
                          labelText: '직책',
                          isRequired: true,
                          onSelect: () {});
                    }),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: DialogActionButton(
                          title: controller.isEdit ? '수정' : '추가',
                          color: AppColors.primaryColor,
                          titleColor: Colors.white,
                          onPressed: () async {
                            final bool result = controller.post();
                            result
                                ? Get.back()
                                : Dialogs.alert(
                                    title: '업로드 불가',
                                    content: '양식을 모두 채워주세요',
                                  );
                          },
                        ),
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

  Widget buildTextField(
      {required TextEditingController controller,
      required String labelText,
      bool isRequired = false,
      Function? onSelect}) {
    Text label = isRequired
        ? Text.rich(TextSpan(
            children: <InlineSpan>[
              WidgetSpan(
                child: Text(labelText),
              ),
              WidgetSpan(
                child: Text(
                  '*',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ))
        : Text(labelText);

    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      readOnly: onSelect != null,
      decoration: InputDecoration(
        suffixIcon: onSelect == null
            ? null
            : Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.primaryColor,
                size: 36,
              ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        labelStyle: TextStyle(color: AppColors.primaryDarkColor),
        label: label,
      ),
      onTap: () => onSelect?.call(),
    );
  }
}
