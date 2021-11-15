import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/values/string.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/user_type_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double buttonSize = Get.height / 6;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
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
            ),
            UserTypeButton(
                imagePath: '',
                title: Strings.teacher,
                content: Strings.teacherContent,
                size: buttonSize),
            UserTypeButton(
                imagePath: '',
                title: Strings.owner,
                content: Strings.ownerContent,
                size: buttonSize),
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
        ),
      ),
    );
  }
}
