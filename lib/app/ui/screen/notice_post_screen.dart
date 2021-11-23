import 'package:ballet_helper/app/controller/notice_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NoticePostScreen extends GetView<NoticeController> {
  const NoticePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        title: Text(
          '알림장 작성',
          style: TextStyles.buttonBrightTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: AppColors.primaryDarkColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: Get.back,
                      child: Text(
                        '취소',
                        style: TextStyles.buttonBrightContentStyle,
                      )),
                  TextButton(
                      onPressed: () {
                        controller.addNotice(title: 'g', content: 'ㅎ');
                        Get.back();
                      },
                      child: Text(
                        '완료',
                        style: TextStyles.buttonBrightContentStyle,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
