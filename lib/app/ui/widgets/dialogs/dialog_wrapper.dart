import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DialogWrapper extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  const DialogWrapper({Key? key, this.title, this.content, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.dialogColor,
            boxShadow: kElevationToShadow[1]),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title ?? const SizedBox.shrink(),
            content != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: content,
                  )
                : const SizedBox.shrink(),
            actions != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: actions!,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
