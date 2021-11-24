import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlbumPostScreen extends GetView<AlbumController> {
  const AlbumPostScreen({Key? key}) : super(key: key);

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
                              ? () {}
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
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
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
