import 'package:ballet_helper/app/controller/student_controller.dart';
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

class TeacherInfoDialog extends StatelessWidget {
  final UserModel teacher;
  const TeacherInfoDialog({Key? key, required this.teacher}) : super(key: key);

  edit() {
    Get.back(result: 'edit');
  }

  delete() {
    Get.back(result: 'delete');
  }

  invite() async {
    await Share.share('[학원 이름]\n'
        '${teacher.name}님, 원생 관리를 더욱 편하게 해보세요!\n'
        '=> 링크를 통해 앱을 설치한 후 회원가입 화면에서 초대코드를 입력해주세요!\n'
        '(초대코드: TESTCODE)');
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      title: Center(
        child: Text(
          '교사 정보',
          style: TextStyles.bottomSheetTitleStyle,
        ),
      ),
      content: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                child: Image(
                  image: teacher.profileData ??
                      AssetImage('assets/images/test_student_avatar.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${teacher.name} (${teacher.position})'),
                  Text('📱 ${teacher.phone ?? '-'}'),
                  Text('${teacher.branchName ?? '미정'}'),
                  Text('${teacher.className ?? '미정'}'),
                ],
              ),
            )
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
          title: '초대코드 전송',
          color: AppColors.primaryColor,
          titleColor: Colors.white,
          onPressed: invite,
        ),
        DialogActionButton(
          title: '교사 삭제',
          onPressed: delete,
          color: AppColors.delete,
          titleColor: AppColors.white,
        ),
      ],
    );
  }
}
