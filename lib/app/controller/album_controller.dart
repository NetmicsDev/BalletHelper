import 'dart:developer';

import 'package:ballet_helper/app/controller/feed_controller.dart';
import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/album_model.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AlbumController extends GetxController {
  final mainController = Get.find<HomeController>();
  bool get isPreview => mainController.isPreview;
  String get academyId => mainController.academyId;

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

  List<StudentModel> get studentList =>
      isPreview ? getDummyStudentList() : getStudentList();

  AlbumModel? postModel;
  final ImagePicker _picker = ImagePicker();
  final List<String> postImages = <String>[].obs;
  final List<StudentModel> postStudents = <StudentModel>[].obs;
  final contentInputController = TextEditingController();

  void pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      postImages.addAll(images.map((e) => e.path).toList());
    }
  }

  void deleteImage(String image) {
    postImages.remove(image);
  }

  void setStudents(List<StudentModel> students) {
    postStudents.clear();
    students.sort((s1, s2) => s1.name!.compareTo(s2.name!));
    postStudents.addAll(students);
  }

  void deleteStudent(StudentModel student) {
    postStudents.remove(student);
  }

  initPostData() {
    postModel = null;
    postImages.clear();
    postStudents.clear();
    contentInputController.clear();
  }

  setDataForFix(AlbumModel data) {
    postImages.addAll(data.images!);
    postStudents.addAll(data.students!);
    postModel = data;
    contentInputController.text = data.content!;
  }

  bool post() => postModel != null ? fixAlbum() : addAlbum();

  addAlbum() {
    final content = contentInputController.text;
    if (postImages.isEmpty || content == '') {
      return false;
    }
    final data = AlbumModel(
      id: albumList.length.toString(),
      name: mainController.userData.name,
      profile: mainController.userData.profile,
      dateTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      content: contentInputController.text,
      images: List.from(postImages),
      students: List.from(postStudents),
    );
    isPreview ? albumList.insert(0, data) : () {};

    initPostData();
    return true;
  }

  fixAlbum() {
    final content = contentInputController.text;
    if (postImages.isEmpty || content == '') {
      return false;
    }
    final data = AlbumModel(
      id: postModel!.id,
      name: postModel!.name,
      profile: postModel!.profile,
      dateTime: postModel!.dateTime,
      content: contentInputController.text,
      images: List.from(postImages),
      students: List.from(postStudents),
    );
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
    return DummyDatas.albumList
        .where((element) => element.academyId == academyId);
  }

  getAlbumData() {
    return [];
  }

  getDummyStudentList() {
    return DummyDatas.studentList;
  }

  getStudentList() {
    return [];
  }
}
