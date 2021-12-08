import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheets.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class OptionButton extends StatelessWidget {
  final List<String> options;
  final Function(int) onSelected;
  final double height;
  const OptionButton(
      {Key? key,
      required this.options,
      required this.onSelected,
      this.height = 30})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double dotSize = height / 8;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        final result = await BottomSheets.select(options: options);
        if (result != null) {
          onSelected(result);
        }
      },
      child: Container(
        width: 20,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: dotSize,
              height: dotSize,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
            Container(
              width: dotSize,
              height: dotSize,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
            Container(
              width: dotSize,
              height: dotSize,
              decoration:
                  BoxDecoration(color: Colors.black, shape: BoxShape.circle),
            ),
          ],
        ),
      ),
    );
  }
}
