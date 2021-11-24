import 'dart:developer';
import 'dart:io';

import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AlbumPostScreen extends GetView<AlbumController> {
  AlbumPostScreen({Key? key}) : super(key: key);

  inputDecoration(String hint) => InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      );

  final double imageSize = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 50,
        title: const Text(
          '앨범 작성',
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
                        onPressed: Get.back,
                        child: const Text(
                          '취소',
                          style: TextStyles.buttonBrightContentStyle,
                        )),
                    TextButton(
                        onPressed: () async {
                          final bool result = controller.addAlbum();
                          result
                              ? Get.back()
                              : Get.defaultDialog(
                                  title: '업로드 불가',
                                  content: Text('양식을 모두 채워주세요'));
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 8.0,
                      ),
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Material(
                                color: Colors.grey[200],
                                child: InkWell(
                                  onTap: controller.pickImages,
                                  child: Container(
                                    width: imageSize,
                                    height: imageSize,
                                    child: Center(
                                      child: Icon(
                                        Icons.add_photo_alternate_outlined,
                                        color: Colors.grey,
                                        size: 36,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            ...controller.imageList
                                .map<Widget>(buildImage)
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                    Divider(height: 1),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: controller.contentInputController,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                          decoration: inputDecoration('내용을 입력하세요'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String image) {
    return Container(
      color: Colors.grey[200],
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: imageSize,
      height: imageSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(child: Image.file(File(image))),
          Positioned(
            top: -6,
            right: -6,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.7),
              ),
              child: IconButton(
                  iconSize: 20,
                  splashRadius: 20,
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    controller.deleteImage(image);
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 20,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
