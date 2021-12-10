import 'dart:developer';

import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/chips/student_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

import 'bottom_sheet_wrapper.dart';

class BottomSheetCreate extends StatefulWidget {
  final String title;
  final List<String> selectedList;

  BottomSheetCreate({
    Key? key,
    required this.title,
    required this.selectedList,
  }) : super(key: key);

  @override
  _BottomSheetCreateState createState() => _BottomSheetCreateState();
}

class _BottomSheetCreateState extends State<BottomSheetCreate> {
  final _tec = TextEditingController();
  final List<String> selectedList = <String>[].obs;

  @override
  void initState() {
    super.initState();
    selectedList.addAll(widget.selectedList);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: Get.focusScope?.unfocus,
      child: BotttomSheetWrapper(
        title: widget.title,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _tec,
                    cursorColor: AppColors.primaryColor,
                    style: TextStyle(color: AppColors.primaryDarkColor),
                    decoration: InputDecoration(
                      hintText: '반 이름을 입력해주세요',
                      hintStyle: TextStyle(color: AppColors.primaryDarkColor),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (_tec.text != '') {
                        selectedList.add(_tec.text);
                        _tec.clear();
                      }
                    },
                    icon: Icon(
                      Icons.add_rounded,
                      color: AppColors.primaryColor,
                      size: 36,
                    ))
              ],
            ),
            SizedBox(height: 20),
            Obx(
              () => Wrap(
                spacing: 10,
                runSpacing: 10,
                children: selectedList
                    .map((e) => StudentChip(
                          name: e.toString(),
                          onDeleted: () => selectedList.remove(e),
                        ))
                    .toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Obx(() => DialogActionButton(
                    title: '추가(${selectedList.length})',
                    onPressed: () {
                      Get.back(result: selectedList);
                    },
                    color: AppColors.primaryColor,
                    titleColor: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
