import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class CodeCheckPage extends StatefulWidget {
  CodeCheckPage({Key? key}) : super(key: key);

  @override
  _CodeCheckPageState createState() => _CodeCheckPageState();
}

class _CodeCheckPageState extends State<CodeCheckPage> {
  final LoginController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 20),
          child: Text('받으신 코드를 입력해주세요!'),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
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
