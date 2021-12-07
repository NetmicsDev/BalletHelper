import 'package:ballet_helper/app/controller/album_controller.dart';
import 'package:ballet_helper/app/controller/family_controller.dart';
import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/controller/my_page_controller.dart';
import 'package:ballet_helper/app/controller/notice_controller.dart';
import 'package:ballet_helper/app/controller/student_controller.dart';
import 'package:ballet_helper/app/controller/teacher_controller.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/screen/album_post_screen.dart';
import 'package:ballet_helper/app/ui/screen/album_screen.dart';
import 'package:ballet_helper/app/ui/screen/family_screen.dart';
import 'package:ballet_helper/app/ui/screen/home_screen.dart';
import 'package:ballet_helper/app/ui/screen/login/login_screen.dart';
import 'package:ballet_helper/app/ui/screen/login/user_type_page.dart';
import 'package:ballet_helper/app/ui/screen/my_page_screen.dart';
import 'package:ballet_helper/app/ui/screen/notice_post_screen.dart';
import 'package:ballet_helper/app/ui/screen/notice_screen.dart';
import 'package:ballet_helper/app/ui/screen/preview_screen.dart';
import 'package:ballet_helper/app/ui/screen/student_post_screen.dart';
import 'package:ballet_helper/app/ui/screen/student_screen.dart';
import 'package:ballet_helper/app/ui/screen/teacher_post_screen.dart';
import 'package:ballet_helper/app/ui/screen/teacher_screen.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: Routes.preview,
      page: () => PreviewScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder(() {
        Get.put(MainController());
      }),
    ),
    GetPage(
      name: Routes.notice,
      page: () => NoticeScreen(),
      transition: Transition.downToUp,
      binding: BindingsBuilder(() {
        Get.put(NoticeController());
      }),
    ),
    GetPage(
      name: Routes.noticePost,
      page: () => NoticePostScreen(),
      transition: Transition.cupertinoDialog,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.album,
      page: () => AlbumScreen(),
      transition: Transition.downToUp,
      binding: BindingsBuilder(() {
        Get.put(AlbumController());
      }),
    ),
    GetPage(
      name: Routes.albumPost,
      page: () => AlbumPostScreen(),
      transition: Transition.cupertinoDialog,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.myPage,
      page: () => MyPageScreen(),
      transition: Transition.rightToLeft,
      binding: BindingsBuilder(() {
        Get.put(MyPageController());
      }),
    ),
    GetPage(
      name: Routes.family,
      page: () => FamilyScreen(),
      transition: Transition.rightToLeft,
      binding: BindingsBuilder(() {
        Get.put(FamilyController());
      }),
    ),
    GetPage(
      name: Routes.student,
      page: () => StudentScreen(),
      transition: Transition.rightToLeft,
      binding: BindingsBuilder(() {
        Get.put(StudentController());
      }),
    ),
    GetPage(
      name: Routes.studentPost,
      page: () => StudentPostScreen(),
      transition: Transition.cupertinoDialog,
      // transitionDuration: Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.teacher,
      page: () => TeacherScreen(),
      transition: Transition.rightToLeft,
      binding: BindingsBuilder(() {
        Get.put(TeacherController());
      }),
    ),
    GetPage(
      name: Routes.teacherPost,
      page: () => TeacherPostScreen(),
      transition: Transition.cupertinoDialog,
      // transitionDuration: Duration(milliseconds: 500),
    ),
  ];
}
