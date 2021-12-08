import 'dart:developer';

import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

import 'bottom_sheet_wrapper.dart';

class BottomSheetAdd<T> extends StatefulWidget {
  final String title;
  final List<T> options;
  final List<T> selectedList;
  final Widget Function(T) itemBuilder;
  Widget Function(T)? leadingBuilder;

  BottomSheetAdd({
    Key? key,
    required this.title,
    required this.options,
    required this.selectedList,
    required this.itemBuilder,
    this.leadingBuilder,
  }) : super(key: key);

  @override
  _BottomSheetAddState<T> createState() => _BottomSheetAddState<T>();
}

class _BottomSheetAddState<T> extends State<BottomSheetAdd<T>> {
  final List<T> selectedList = <T>[].obs;

  @override
  void initState() {
    super.initState();
    selectedList.addAll(widget.selectedList);
  }

  @override
  Widget build(BuildContext context) {
    return BotttomSheetWrapper(
      title: widget.title,
      child: Expanded(
        child: Column(
          children: [
            Expanded(
              child: Scrollbar(
                thickness: 3,
                radius: const Radius.circular(3),
                isAlwaysShown: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.options.length,
                  itemBuilder: (context, index) =>
                      buildItem(widget.options[index]),
                ),
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

  Widget buildItem(T item) {
    return Obx(() {
      final bool isSelected = selectedList.contains(item);
      return Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.3)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: ListTile(
          leading: widget.leadingBuilder?.call(item),
          title: widget.itemBuilder(item),
          trailing: isSelected
              ? Material(
                  elevation: 0,
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(width: 12, height: 12),
                )
              : null,
          onTap: () {
            isSelected ? selectedList.remove(item) : selectedList.add(item);
          },
        ),
      );
    });
  }
}
