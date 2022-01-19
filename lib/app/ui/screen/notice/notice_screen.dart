import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/controller/notice_controller.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/bulletin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeScreen extends GetView<NoticeController> {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: AppColors.current.primary,
        title: Text(
          '알림장',
          style: TextStyles.buttonBrightTitleStyle,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.close,
              size: 24,
              color: AppColors.brightTextColor,
            ),
          )
        ],
      ),
      floatingActionButton:
          controller.mainController.userType != UserType.parent
              ? FloatingActionButton(
                  elevation: 4,
                  onPressed: () {
                    Get.toNamed(Routes.noticePost);
                  },
                  child: Icon(
                    Icons.post_add,
                    color: AppColors.current.primary,
                    size: 30,
                  ),
                  backgroundColor: Colors.white,
                )
              : null,
      backgroundColor: AppColors.current.primary,
      body: Obx(() => ListView.builder(
            itemCount: controller.noticeList.length,
            itemBuilder: (context, index) {
              NoticeModel notice = controller.noticeList[index];
              return Bulletin(
                author: notice.name,
                profile: notice.profileData != null
                    ? notice.profileData as ImageProvider
                    : null,
                dateTime: notice.dateTime,
                title: notice.title,
                content: notice.content,
                image: notice.imageData != null
                    ? notice.imageData as ImageProvider
                    : null,
                onFix: () {
                  controller.setDataForFix(notice);
                  Get.toNamed(Routes.noticePost);
                },
                onDelete: () {
                  controller.deleteNotice(notice);
                },
              );
            },
          )),
    );
  }
}
