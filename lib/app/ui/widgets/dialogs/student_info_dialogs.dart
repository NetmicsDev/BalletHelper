import 'package:ballet_helper/app/data/model/student_model.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/dialog_action_button.dart';
import 'package:ballet_helper/app/ui/widgets/dialogs/dialog_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class StudentInfoDialog extends StatelessWidget {
  final StudentModel student;
  const StudentInfoDialog({Key? key, required this.student}) : super(key: key);

  invite() async {
    await Share.share('[학원 이름]\n'
        '${student.name}의 학원 생활을 지켜보세요!\n'
        '=> 링크를 통해 앱을 설치한 후 회원가입 화면에서 초대코드를 입력해주세요!\n'
        '(초대코드: TESTCODE)');
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      title: Center(
        child: Text(
          '원생 정보',
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
                  image: student.profileData!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(student.name!),
                  Text('생일: ${student.birth ?? '-'}'),
                  Text('연락처: ${student.phone ?? '-'}'),
                  Text(
                      '${student.branchName ?? '미정'} ${student.className ?? '미정'}'),
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
          onPressed: invite,
        ),
        DialogActionButton(
          title: '부모님 초대',
          color: AppColors.primaryColor,
          titleColor: Colors.white,
          onPressed: invite,
        )
      ],
    );
  }
}
