import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class BotttomSheetWrapper extends StatelessWidget {
  final String? title;
  final Widget child;
  const BotttomSheetWrapper({Key? key, this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          title != null
              ? Container(
                  height: 60,
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    title!,
                    style: TextStyles.bottomSheetTitleStyle,
                  ),
                )
              : const SizedBox.shrink(),
          child
        ],
      ),
    );
  }
}
