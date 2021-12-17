import 'dart:developer';

import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/option_button.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class Bulletin extends StatelessWidget {
  final String? author;
  final ImageProvider? profile;
  final String? dateTime;
  final String? title;
  final String? content;
  final ImageProvider? image;
  final Function? onFix;
  final Function? onDelete;

  const Bulletin({
    Key? key,
    this.author,
    this.profile,
    this.dateTime,
    this.title,
    this.content,
    this.image,
    this.onFix,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMine = author!.split(' ')[0] ==
        Get.find<HomeController>().userName.split(' ')[0];
    return Card(
      color: AppColors.cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage: profile,
                    radius: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            author ?? '작성자',
                            style:
                                TextStyles.authorStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            dateTime ?? '5분 전',
                            style:
                                TextStyles.dateTimeStyle.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isMine
                      ? OptionButton(
                          options: ['수정', '삭제'],
                          onSelected: (idx) {
                            idx == 0 ? onFix?.call() : onDelete?.call();
                          },
                          height: 24,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title ?? '알림 제목',
                style: TextStyles.buttonDarkTitleStyle,
                // textAlign: TextAlign.center,
              ),
            ),
            Text(
              content ?? '알림 내용',
              style: TextStyles.buttonDarkContentStyle,
            ),
            image != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                        image: image!,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
