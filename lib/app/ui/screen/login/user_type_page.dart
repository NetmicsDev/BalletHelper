import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/values/string.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/user_type_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

class UserTypePage extends StatefulWidget {
  UserTypePage({Key? key}) : super(key: key);

  @override
  _UserTypePageState createState() => _UserTypePageState();
}

class _UserTypePageState extends State<UserTypePage> {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    double buttonSize = Get.height / 6;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text(Strings.chooseUserType, style: headlineStyle)),
        const SizedBox(height: 20),
        UserTypeButton(
          imagePath: '',
          title: Strings.parent,
          content: Strings.parentContent,
          size: buttonSize,
          onClick: () => _controller.toChooseSign(Strings.parent),
        ),
        UserTypeButton(
          imagePath: '',
          title: Strings.teacher,
          content: Strings.teacherContent,
          size: buttonSize,
          onClick: () => _controller.toChooseSign(Strings.teacher),
        ),
        UserTypeButton(
          imagePath: '',
          title: Strings.owner,
          content: Strings.ownerContent,
          size: buttonSize,
          onClick: () => _controller.toChooseSign(Strings.owner),
        ),
        SizedBox(height: 30),
        TextButton(
            onPressed: () => Get.toNamed(
                  Routes.preview,
                ),
            child: Text(
              "체험하기",
              style: TextStyle(decoration: TextDecoration.underline),
            ))
      ],
    );
  }
}
