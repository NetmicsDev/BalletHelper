import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class DialogWrapper extends StatelessWidget {
  final Widget? title;
  final Widget? content;
  final Axis actionsOrientation;
  final List<Widget>? actions;
  const DialogWrapper({
    Key? key,
    this.title,
    this.content,
    this.actionsOrientation = Axis.horizontal,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> indexList =
        Iterable<int>.generate(actions == null ? 0 : actions!.length * 2 - 1)
            .toList();
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
                ? actionsOrientation == Axis.horizontal
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: indexList
                            .map((idx) => idx.isEven
                                ? Expanded(child: actions![idx ~/ 2])
                                : const SizedBox(width: 10))
                            .toList(),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: indexList
                            .map((idx) => idx.isEven
                                ? actions![idx ~/ 2]
                                : const SizedBox(height: 10))
                            .toList(),
                      )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
