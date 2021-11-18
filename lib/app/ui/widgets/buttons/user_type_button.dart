import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class UserTypeButton extends StatelessWidget {
  final String imagePath;
  final String title;
  final String content;
  final double? size;
  final Function()? onClick;
  const UserTypeButton(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.content,
      this.size,
      this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _size = size ?? 150;
    return Card(
      color: AppColors.buttonDefaultColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => onClick?.call(),
        highlightColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/test_user_type.png',
              width: _size,
              height: _size,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.buttonDarkTitleStyle),
                    const SizedBox(height: 10),
                    Text(
                      content,
                      style: TextStyles.buttonDarkContentStyle,
                    )
                  ],
                ),
              ),
            ),
            // Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 10),
            //     child: Image.asset(
            //       'assets/images/next.png',
            //       width: 30,
            //       height: 50,
            //       fit: BoxFit.fill,
            //     )),
          ],
        ),
      ),
    );
  }
}
