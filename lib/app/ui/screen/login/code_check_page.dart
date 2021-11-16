import 'package:flutter/material.dart';

class CodeCheckPage extends StatefulWidget {
  CodeCheckPage({Key? key}) : super(key: key);

  @override
  _CodeCheckPageState createState() => _CodeCheckPageState();
}

class _CodeCheckPageState extends State<CodeCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('코드 입력 화면'),
    );
  }
}
