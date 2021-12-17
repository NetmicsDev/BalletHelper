import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
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
            Get.defaultDialog(title: '오류', content: Text('아직 구현이 안된 페이지 입니다'));
          }
        },
        child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyles.buttonMenuStyle,
                ),
                Image(
                  image: AssetImage(assetPath == ''
                      ? 'assets/images/flutter_logo.png'
                      : assetPath),
                  color: Colors.white,
                  width: size / 2.2,
                ),
              ],
            )),
      ),
    );
  }
}
