import 'dart:developer';

import 'package:ballet_helper/app/controller/feed_controller.dart';
import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AlbumController extends GetxController {
  final mainController = Get.find<MainController>();
  bool get isPreview => mainController.isPreview;

  @override
  void onInit() {
    super.onInit();
    albumList.addAll(isPreview ? getDummyAlbumData() : getAlbumData());
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxList<AlbumModel> albumList = <AlbumModel>[].obs;
  String get selectedBranch =>
      '${mainController.userData.branchName} ${mainController.userData.className}';

  AlbumModel? postModel;
  final ImagePicker _picker = ImagePicker();
  final List<String> imageList = <String>[].obs;
  final List<StudentModel> studentList = <StudentModel>[].obs;
  final contentInputController = TextEditingController();

  void pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      imageList.addAll(images.map((e) => e.path).toList());
    }
  }

  void deleteImage(String image) {
    imageList.remove(image);
  }

  void setStudents(List<StudentModel> students) {
    studentList.clear();
    students.sort((s1, s2) => s1.name!.compareTo(s2.name!));
    studentList.addAll(students);
  }

  void deleteStudent(StudentModel student) {
    studentList.remove(student);
  }

  initPostData() {
    postModel = null;
    imageList.clear();
    studentList.clear();
    contentInputController.clear();
  }

  setDataForFix(AlbumModel data) {
    imageList.addAll(data.images!);
    studentList.addAll(data.students!);
    postModel = data;
    contentInputController.text = data.content!;
  }

  bool post() => postModel != null ? fixAlbum() : addAlbum();

  addAlbum() {
    final content = contentInputController.text;
    if (imageList.isEmpty || content == '') {
      return false;
    }
    final data = AlbumModel(
        id: albumList.length.toString(),
        name: mainController.userData.name,
        profile: mainController.userData.profile,
        dateTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        content: contentInputController.text,
        images: List.from(imageList),
        students: List.from(studentList));
    isPreview ? albumList.insert(0, data) : () {};

    initPostData();
    return true;
  }

  fixAlbum() {
    final content = contentInputController.text;
    if (imageList.isEmpty || content == '') {
      return false;
    }
    final data = AlbumModel(
        id: postModel!.id,
        name: postModel!.name,
        profile: postModel!.profile,
        dateTime: postModel!.dateTime,
        content: contentInputController.text,
        images: List.from(imageList));
    int index = albumList.indexOf(postModel);
    isPreview ? (albumList[index] = data) : () {};
    Get.find<FeedController>(tag: postModel!.id).refresh();

    initPostData();
    return true;
  }

  deleteAlbum(AlbumModel album) {
    albumList.remove(album);
    Get.delete<FeedController>(tag: album.id);
  }

  getDummyAlbumData() {
    return DummyDatas.albumList;
  }

  getAlbumData() {
    return [];
  }
}
