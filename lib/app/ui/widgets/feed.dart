import 'dart:developer';

import 'package:ballet_helper/app/controller/feed_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';

class Feed extends StatelessWidget {
  final String id;
  const Feed({
    Key? key,
    required this.id,
  }) : super(key: key);

  FeedController get controller => Get.find(tag: id);

  @override
  Widget build(BuildContext context) {
    log('feed builded with $id');
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
                backgroundImage: controller.profile,
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
                      controller.author,
                      style: TextStyles.authorStyle,
                    ),
                    Text(
                      controller.dateTime,
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
                controller.imageIndex = index;
              },
            ),
            items: controller.images
                .map((image) => Image(
                      image: image,
                      fit: BoxFit.scaleDown,
                    ))
                .toList(),
          ),
        ),
        buildIndicator(),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text(
            controller.content,
            style: TextStyles.buttonDarkContentStyle,
          ),
        )
      ],
    );
  }

  Widget buildIndicator() {
    return controller.images.length > 1
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            alignment: Alignment.center,
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.images.length, (i) => i)
                      .map((i) {
                    final visible = controller.indicatorStartIndex.value <= i &&
                        i <= controller.indicatorEndIndex.value;
                    final isSide =
                        (i == controller.indicatorStartIndex.value && i != 0) ||
                            (i == controller.indicatorEndIndex.value &&
                                i != controller.images.length - 1);
                    final double dotSize = visible
                        ? !isSide
                            ? 8
                            : 5
                        : 0;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: dotSize,
                      height: dotSize,
                      margin: EdgeInsets.symmetric(horizontal: visible ? 3 : 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: i == controller.imageIndex
                              ? AppColors.primaryColor
                              : AppColors.subtitleColor.withOpacity(0.2)),
                    );
                  }).toList(),
                )),
          )
        : const SizedBox.shrink();
  }
}
