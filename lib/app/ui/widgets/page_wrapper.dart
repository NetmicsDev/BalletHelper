import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget page;
  const PageWrapper({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: page,
    );
  }
}
