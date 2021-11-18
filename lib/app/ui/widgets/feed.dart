import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/test_owner_avatar.jpg'),
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
                      '작성자',
                      style: TextStyles.authorStyle,
                    ),
                    Text(
                      '5분 전',
                      style: TextStyles.dateTimeStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
