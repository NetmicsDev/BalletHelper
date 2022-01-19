import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AddChip extends StatelessWidget {
  final String title;
  final Function() onAdd;
  const AddChip({Key? key, required this.title, required this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      avatar: Icon(
        Icons.add,
        color: AppColors.current.primary,
        size: 20,
      ),
      side: BorderSide(color: AppColors.current.primary),
      backgroundColor: Colors.white,
      label: Text(
        title,
        style: TextStyles.chipDarkStyle,
      ),
      labelPadding: const EdgeInsets.only(right: 8),
      pressElevation: 0,
      onPressed: onAdd,
    );
  }
}
