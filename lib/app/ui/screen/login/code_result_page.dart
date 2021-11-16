import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class CodeResultPage extends StatefulWidget {
  CodeResultPage({Key? key}) : super(key: key);

  @override
  _CodeResultPageState createState() => _CodeResultPageState();
}

class _CodeResultPageState extends State<CodeResultPage> {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 20),
          child: Text('입력하신 코드 입니다'),
        ),
        Text(_controller.code!),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton(
            onPressed: () => _controller.toSignUp(),
            child: Text('확인'),
          ),
        )
      ],
    );
  }
}
