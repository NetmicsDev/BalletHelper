import 'dart:developer';
import 'dart:io';

import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheets.dart';
import 'package:ballet_helper/app/ui/widgets/chips/add_chip.dart';
import 'package:ballet_helper/app/ui/widgets/chips/student_chip.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:ballet_helper/app/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AlbumPostScreen extends GetView<AlbumController> {
  AlbumPostScreen({Key? key}) : super(key: key);

  final double imageSize = 160;

  inputDecoration(String hint) => InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
      );

  void cancel() async {
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
          title: const Text(
            '앨범 작성',
            style: TextStyles.buttonBrightTitleStyle,
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: Get.focusScope?.unfocus,
              child: SizedBox(
                width: Get.width,
                height: Get.height -
                    MediaQuery.of(context).padding.top -
                    kToolbarHeight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildOptionArea(),
                    SizedBox(
                      height: 40,
                      child: Center(
                        child: Text(
                          controller.selectedBranch,
                          style: TextStyles.buttonDarkContentStyle,
                        ),
                      ),
                    ),
                    const Divider(indent: 16.0, endIndent: 16.0, height: 1),
                    buildImageUploadArea(),
                    buildTagArea(),
                    Divider(indent: 16.0, endIndent: 16.0, height: 1),
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
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOptionArea() {
    return Container(
      color: AppColors.current.primaryDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: cancel,
            child: const Text(
              '취소',
              style: TextStyles.buttonBrightContentStyle,
            ),
          ),
          TextButton(
              onPressed: () async {
                final bool result = controller.post();
                result
                    ? Get.back()
                    : Dialogs.alert(
                        title: '업로드 불가',
                        content: '양식을 모두 채워주세요',
                      );
              },
              child: const Text(
                '완료',
                style: TextStyles.buttonBrightContentStyle,
              )),
        ],
      ),
    );
  }

  Widget buildImageUploadArea() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
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
              ...controller.postImages.map<Widget>(buildImage).toList(),
            ],
          )),
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
          Center(
              child: Image(
            image: ImageUtils.pathToImage(image),
          )),
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

  Widget buildTagArea() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AddChip(
                    title: '학생 추가',
                    onAdd: () async {
                      final result = await BottomSheets.add<StudentModel>(
                        title: '아이를 선택하세요',
                        options: controller.studentList,
                        selectedList: controller.postStudents,
                        itemBuilder: (student) => Text(
                          student.name!,
                          style: TextStyles.authorStyle,
                        ),
                        leadingBuilder: (student) => CircleAvatar(
                          backgroundImage: student.profileData,
                          backgroundColor: AppColors.current.primary,
                        ),
                      );
                      if (result == null) return;
                      controller.setStudents(result);
                    }),
              ),
              ...controller.postStudents.map<Widget>(buildTag).toList(),
            ],
          )),
    );
  }

  Widget buildTag(StudentModel student) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: StudentChip(
        name: student.name!,
        onDeleted: () {
          controller.deleteStudent(student);
        },
      ),
    );
  }
}
