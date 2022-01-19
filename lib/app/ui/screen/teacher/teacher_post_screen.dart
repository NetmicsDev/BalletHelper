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
          backgroundColor: AppColors.current.primary,
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
                      hintText: '이름을 입력해주세요',
                      isRequired: true,
                    ),
                    SizedBox(height: 20),
                    buildTextField(
                      controller: controller.phoneTEC,
                      labelText: '연락처',
                      hintText: '휴대폰 번호를 입력해주세요',
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      final hintText = controller.selectedBranch.isNotEmpty
                          ? controller.selectedBranch.toString()
                          : '-';
                      return buildTextField(
                          labelText: '지점',
                          hintText: hintText,
                          isRequired: true,
                          onTap: controller.showBranchSheet);
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      final hintText = controller.selectedClass.isNotEmpty
                          ? controller.selectedClass.toString()
                          : '-';
                      return buildTextField(
                          labelText: '반',
                          hintText: hintText,
                          isRequired: true,
                          onTap: controller.showClassSheet);
                    }),
                    SizedBox(height: 20),
                    Obx(() {
                      final hintText = controller.selectedPosition;
                      return buildTextField(
                          labelText: '직책',
                          hintText: hintText,
                          isRequired: true,
                          onTap: controller.showPositionSheet);
                    }),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: DialogActionButton(
                          title: controller.isEdit ? '수정' : '추가',
                          color: AppColors.current.primary,
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
      {TextEditingController? controller,
      required String labelText,
      String hintText = '-',
      bool isRequired = false,
      Function? onTap}) {
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
      cursorColor: AppColors.current.primary,
      style: TextStyle(color: AppColors.current.primaryDark),
      readOnly: onTap != null,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.current.primaryDark),
        suffixIcon: onTap == null
            ? null
            : Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.current.primary,
                size: 36,
              ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.current.primary)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.current.primary)),
        labelStyle: TextStyle(color: AppColors.current.primaryDark),
        label: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onTap: () => onTap?.call(),
    );
  }
}
