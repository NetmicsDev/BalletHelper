import 'dart:developer';

import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/controller/feed_controller.dart';
import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/notice_controller.dart';
import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/bulletin.dart';
import 'package:ballet_helper/app/ui/widgets/feed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumScreen extends GetView<AlbumController> {
  const AlbumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        title: Text(
          '앨범',
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
                  onPressed: () {
                    Get.toNamed(Routes.albumPost);
                  },
                  child: Icon(
                    Icons.post_add,
                    color: Colors.white,
                    size: 30,
                  ),
                  backgroundColor: AppColors.primaryColor,
                )
              : null,
      body: Obx(() {
        for (var element in controller.albumList) {
          log(element.content!);
        }
        return ListView.builder(
          itemCount: controller.albumList.length,
          itemBuilder: (context, index) {
            AlbumModel album = controller.albumList[index];
            String tag = album.id.toString();
            bool isExist = Get.isRegistered<FeedController>(tag: album.id);
            isExist
                ? Get.find<FeedController>(tag: album.id).setData(album)
                : Get.put(FeedController(album), tag: tag);
            return Feed(id: tag);
          },
        );
      }),
    );
  }
}
