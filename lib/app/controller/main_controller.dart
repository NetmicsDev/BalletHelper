import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  MainController({bool? isPreview, UserType? userType}) {
    this.isPreview = isPreview ?? false;
    this.userType = userType ?? _loginController.currentUserType!;
    log('$isPreview $userType');
  }
  final LoginController _loginController = Get.find();
  late final bool isPreview;
  late final UserType userType;
}
