import 'package:ballet_helper/app/controller/student_controller.dart';
import 'package:ballet_helper/app/data/model/branch_model.dart';
import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialog_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:share_plus/share_plus.dart';

class BranchInfoDialog extends StatelessWidget {
  final BranchModel branch;
  const BranchInfoDialog({Key? key, required this.branch}) : super(key: key);

  edit() {
    Get.back(result: 'edit');
  }

  delete() {
    Get.back(result: 'delete');
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      title: Center(
        child: Text(
          '지점 정보',
          style: TextStyles.bottomSheetTitleStyle,
        ),
      ),
      content: SizedBox(
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('지점명: ${branch.name}'),
            Text('주소: ${branch.address}'),
            Text('교사 목록: ${branch.teachers!.map((e) => e.name).toList()}'),
            Text('반 목록: ${branch.classList}'),
            Text('원생 수: ${branch.studentCount}'),
          ],
        ),
      ),
      actionsOrientation: Axis.vertical,
      actions: [
        DialogActionButton(
          title: '정보 수정',
          onPressed: edit,
        ),
        DialogActionButton(
          title: '지점 삭제',
          onPressed: delete,
          color: AppColors.delete,
          titleColor: AppColors.white,
        ),
      ],
    );
  }
}
