import 'package:ballet_helper/app/controller/notice_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NoticePostScreen extends GetView<NoticeController> {
  NoticePostScreen({Key? key}) : super(key: key);

  inputDecoration(String hint) => InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        title: const Text(
          '알림장 작성',
          style: TextStyles.buttonBrightTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: AppColors.primaryDarkColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () async {
                          final result = await Get.dialog(Dialogs.confirm(
                            title: '작성 취소',
                            content: '작성 중인 내용이 모두 사라집니다. 정말 취소하시겠습니까?',
                          ));
                          if (result ?? false) {
                            controller.initPostData();
                            Get.back();
                          }
                        },
                        child: const Text(
                          '취소',
                          style: TextStyles.buttonBrightContentStyle,
                        )),
                    TextButton(
                        onPressed: () async {
                          final bool result = controller.post();
                          result
                              ? Get.back()
                              : Get.dialog(Dialogs.alert(
                                  title: '업로드 불가',
                                  content: '양식을 모두 채워주세요',
                                ));
                        },
                        child: const Text(
                          '완료',
                          style: TextStyles.buttonBrightContentStyle,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: Center(
                  child: Text(
                    controller.selectedBranch,
                    style: TextStyles.buttonDarkContentStyle,
                  ),
                ),
              ),
              const Divider(
                indent: 16.0,
                endIndent: 16.0,
                height: 1,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller.titleInputController,
                        textInputAction: TextInputAction.next,
                        decoration: inputDecoration('제목을 입력하세요'),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: TextField(
                          controller: controller.contentInputController,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          decoration: inputDecoration('내용을 입력하세요'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
