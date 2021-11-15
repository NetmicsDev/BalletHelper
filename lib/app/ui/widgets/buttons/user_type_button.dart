import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class UserTypeButton extends StatefulWidget {
  final String imagePath;
  final String title;
  final String content;
  final double? size;
  const UserTypeButton(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.content,
      this.size})
      : super(key: key);
  @override
  State<UserTypeButton> createState() => _UserTypeButtonState();
}

class _UserTypeButtonState extends State<UserTypeButton> {
  bool isPressing = false;

  @override
  Widget build(BuildContext context) {
    double size = widget.size ?? 150;
    return Card(
      color: isPressing ? buttonPressedColor : buttonDefaultColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (_) => setState(() {
          isPressing = true;
        }),
        onTapUp: (_) => setState(() {
          isPressing = false;
        }),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/test_user_type.png',
              width: size,
              height: size,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: buttonTitleStyle),
                  SizedBox(height: 10),
                  Text(
                    widget.content,
                    style: buttonContentStyle,
                  )
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  'assets/images/next.png',
                  width: 30,
                  height: 50,
                  fit: BoxFit.fill,
                )),
          ],
        ),
      ),
    );
  }
}
