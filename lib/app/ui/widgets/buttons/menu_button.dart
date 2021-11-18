import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

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
        onTap: () {},
        child: Container(
            width: size,
            height: size,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyles.menuButtonStyle,
                ),
                Image(
                  image: AssetImage('assets/images/flutter_logo.png'),
                  width: size / 2,
                ),
              ],
            )),
      ),
    );
  }
}
