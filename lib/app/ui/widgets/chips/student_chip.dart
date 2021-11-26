import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class StudentChip extends StatelessWidget {
  final String name;
  final Function()? onDeleted;
  const StudentChip({Key? key, required this.name, this.onDeleted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      side: const BorderSide(color: AppColors.primaryColor),
      backgroundColor: AppColors.primaryColor,
      label: Text(name, style: TextStyles.chipBrightStyle),
      labelPadding: onDeleted != null
          ? const EdgeInsets.only(left: 8)
          : const EdgeInsets.symmetric(horizontal: 8),
      deleteIcon: const Icon(
        Icons.close,
        size: 18,
        color: Colors.white,
      ),
      onDeleted: onDeleted,
    );
  }
}
