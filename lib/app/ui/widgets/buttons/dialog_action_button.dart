import 'dart:developer';

import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DialogActionButton extends StatelessWidget {
  final Color color;
  final String title;
  final Color titleColor;
  final Function? onPressed;
  const DialogActionButton({
    Key? key,
    this.color = Colors.white,
    required this.title,
    this.titleColor = Colors.black,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: color == Colors.white
            ? BorderSide(color: AppColors.borderDefaultColor, width: 0.5)
            : BorderSide.none,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: AppColors.borderDefaultColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          onPressed?.call();
        },
        child: SizedBox(
          height: 40,
          child: Center(
            child: Text(
              title,
              style: TextStyles.buttonActionStyle.copyWith(color: titleColor),
            ),
          ),
        ),
      ),
    );
  }
}
