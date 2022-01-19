import 'package:ballet_helper/app/controller/academy_controller.dart';
import 'package:flutter/material.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:get/get.dart';

class BranchPostScreen extends GetView<AcademyController> {
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
            controller.isEdit ? '지점 정보 수정' : '지점 추가',
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
                height: Get.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight,
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
                      controller: controller.addressTEC,
                      labelText: '주소',
                      hintText: '주소를 입력해주세요',
                    ),
                    SizedBox(height: 20),
                    () {
                      final hintText = controller.branchModel != null &&
                              controller.branchModel!.teachers!.isNotEmpty
                          ? controller.branchModel!.represent.name!
                          : '-';
                      return buildTextField(
                          labelText: '담당자', hintText: hintText, onTap: () {});
                    }(),
                    SizedBox(height: 20),
                    Obx(() {
                      final hintText = controller.classList.isNotEmpty
                          ? controller.classList.toString()
                          : '-';
                      return buildTextField(
                          labelText: '반',
                          hintText: hintText,
                          onTap: controller.showClassCreateSheet);
                    }),
                    SizedBox(height: 20),
                    () {
                      final hintText = controller.branchModel != null
                          ? controller.branchModel!.studentCount.toString()
                          : '0';
                      return buildTextField(
                          labelText: '원생 수',
                          disabled: true,
                          hintText: hintText,
                          onTap: () {});
                    }(),
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
      bool disabled = false,
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
      enabled: !disabled,
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
        disabledBorder: OutlineInputBorder(
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
