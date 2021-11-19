import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/controller/notice_controller.dart';
import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/data/model/notice_model.dart';
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
      body: ListView.builder(
        itemCount: controller.albumList.length,
        itemBuilder: (context, index) {
          AlbumModel album = controller.albumList[index];
          return Feed(
            author: album.name,
            profile: album.profileData,
            dateTime: album.dateTime,
            content: album.content,
            images: album.imagesData,
          );
        },
      ),
    );
  }
}
