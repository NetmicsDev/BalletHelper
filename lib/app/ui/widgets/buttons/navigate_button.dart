import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const NavigateButton({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Text(
          title,
          style: TextStyles.buttonNavigateStyle,
        ),
      ),
      style: const ButtonStyle(alignment: Alignment.centerLeft),
    );
  }
}
