import 'dart:developer';

import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class Feed extends StatefulWidget {
  final String? author;
  final ImageProvider? profile;
  final String? dateTime;
  final String? content;
  final List<ImageProvider>? images;
  Feed({
    Key? key,
    this.author,
    this.profile,
    this.dateTime,
    this.content,
    this.images,
  }) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundImage: widget.profile,
                radius: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.author ?? '작성자',
                      style: TextStyles.authorStyle,
                    ),
                    Text(
                      widget.dateTime ?? '게시 시간',
                      style: TextStyles.dateTimeStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          color: Colors.grey[200],
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1 / 1,
              viewportFraction: 1,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enableInfiniteScroll: false,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: widget.images!
                .map((image) => Image(
                      image: image,
                      fit: BoxFit.scaleDown,
                    ))
                .toList(),
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            widget.content ?? '피드 내용',
            style: TextStyles.buttonDarkContentStyle,
          ),
        )
      ],
    );
  }
}
