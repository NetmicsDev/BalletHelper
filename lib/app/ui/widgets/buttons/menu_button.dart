import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MenuButton extends StatelessWidget {
  final double size;
  final Color color;
  final String title;
  final String assetPath;
  final String routeName;
  const MenuButton(
      {Key? key,
      required this.size,
      required this.color,
      required this.title,
      required this.assetPath,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        splashColor: Colors.white.withOpacity(0.5),
        highlightColor: color.withOpacity(0.5),
        onTap: () {
          try {
            Get.toNamed(routeName);
          } catch (err) {
            Dialogs.alert(
              title: '구현 중',
              content: '다음 업데이트를 기다려주세요!',
            );
          }
        },
        child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(assetPath == ''
                      ? 'assets/images/flutter_logo.png'
                      : assetPath),
                  color: Colors.white,
                  width: size / 2.2,
                ),
                Text(
                  title,
                  style: TextStyles.buttonMenuStyle.copyWith(fontSize: 14),
                ),
              ],
            )),
      ),
    );
  }
}
