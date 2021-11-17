import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/user_type_button.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class ChooseSignPage extends StatefulWidget {
  ChooseSignPage({Key? key}) : super(key: key);

  @override
  _ChooseSignPageState createState() => _ChooseSignPageState();
}

class _ChooseSignPageState extends State<ChooseSignPage> {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserTypeButton(
          imagePath: '',
          title: '로그인',
          content: '전에 가입했어요!',
          onClick: () => _controller.toSignIn(),
        ),
        UserTypeButton(
          imagePath: '',
          title: '회원가입',
          content: '이번이 처음이에요!',
          onClick: () {
            if (_controller.currentUserType == UserType.owner) {
              _controller.toSignUp();
            } else {
              _controller.toCodeCheck();
            }
          },
        )
      ],
    );
  }
}
