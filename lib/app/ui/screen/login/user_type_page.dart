import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheets.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/user_type_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

class UserTypePage extends StatefulWidget {
  const UserTypePage({Key? key}) : super(key: key);

  @override
  _UserTypePageState createState() => _UserTypePageState();
}

class _UserTypePageState extends State<UserTypePage> {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double buttonSize = Get.height / 7;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              Strings.chooseUserType,
              style: TextStyles.headlineStyle,
            )),
        const SizedBox(height: 20),
        ..._controller.userTypes
            .map<Widget>((user) => UserTypeButton(
                  imagePath: '',
                  title: user['label'],
                  content: user['content'],
                  size: buttonSize,
                  onClick: () => _controller.toChooseSign(user['type']),
                ))
            .toList(),
        UserTypeButton(
          imagePath: '',
          title: Strings.preview,
          content: Strings.previewContent,
          size: buttonSize,
          onClick: showUserTypeModal,
        ),
      ],
    );
  }

  showUserTypeModal() async {
    final result = await BottomSheets.select(
      title: '어떤 회원으로 체험하시겠어요?',
      options: _controller.userTypes.map<String>((e) => e['label']).toList(),
    );
    if (result == null) return;
    Get.put(MainController(
        isPreview: true, userType: _controller.userTypes[result]['type']));
    await Get.toNamed(Routes.preview, arguments: result);
    Get.delete<MainController>();
  }
}
