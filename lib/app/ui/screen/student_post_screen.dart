import 'package:ballet_helper/app/controller/student_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentPostScreen extends GetView<StudentController> {
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
            controller.isEdit ? '원생 정보 수정' : '원생 추가',
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTextField(
                      controller: controller.nameTEC,
                      label: Text.rich(TextSpan(
                        children: <InlineSpan>[
                          WidgetSpan(
                            child: Text(
                              '이름',
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              '*',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      )),
                    ),
                    SizedBox(height: 20),
                    buildTextField(
                        controller: controller.birthTEC, label: Text('생일')),
                    SizedBox(height: 20),
                    buildTextField(
                        controller: controller.phoneTEC, label: Text('연락처')),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: 160,
                            child: Obx(() => DropdownButton<String>(
                                  value: controller.selectedBranch,
                                  isExpanded: true,
                                  iconEnabledColor: AppColors.primaryColor,
                                  underline: Container(
                                      height: 1, color: AppColors.primaryColor),
                                  style: TextStyle(
                                    color: AppColors.primaryDarkColor,
                                    fontSize: 16,
                                  ),
                                  items: controller.branchList
                                      .map((e) => DropdownMenuItem<String>(
                                          value: e,
                                          alignment: Alignment.center,
                                          child: Text(
                                            e,
                                            textAlign: TextAlign.center,
                                          )))
                                      .toList(),
                                  onChanged: (value) =>
                                      controller.selectedBranch = value ?? '판교',
                                )),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            width: 160,
                            child: Obx(() => DropdownButton<String>(
                                  value: controller.selectedClass,
                                  isExpanded: true,
                                  iconEnabledColor: AppColors.primaryColor,
                                  underline: Container(
                                      height: 1, color: AppColors.primaryColor),
                                  style: TextStyle(
                                    color: AppColors.primaryDarkColor,
                                    fontSize: 16,
                                  ),
                                  items: controller.classList
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
                        ),
                      ],
                    ),
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
      {required TextEditingController controller, required Widget label}) {
    return TextField(
        controller: controller,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)),
          labelStyle: TextStyle(color: AppColors.primaryDarkColor),
          label: label,
        ));
  }
}
