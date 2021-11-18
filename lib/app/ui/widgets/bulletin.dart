import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class Bulletin extends StatelessWidget {
  final String? author;
  final ImageProvider? profile;
  final String? dateTime;
  final String? title;
  final String? content;
  final ImageProvider? image;

  const Bulletin({
    Key? key,
    this.author,
    this.profile,
    this.dateTime,
    this.title,
    this.content,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: profile,
                    radius: 25.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author ?? '작성자',
                          style: TextStyles.authorStyle,
                        ),
                        Text(
                          dateTime ?? '5분 전',
                          style: TextStyles.dateTimeStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                title ?? '알림 제목',
                style: TextStyles.buttonDarkTitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                content ?? '알림 내용',
                style: TextStyles.buttonDarkContentStyle,
              ),
            ),
            image != null
                ? Image(
                    image: image!,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
