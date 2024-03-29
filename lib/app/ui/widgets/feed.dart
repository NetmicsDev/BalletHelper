import 'dart:developer';

import 'package:ballet_helper/app/controller/feed_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/bottomsheets/bottom_sheets.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/option_button.dart';
import 'package:ballet_helper/app/ui/widgets/chips/student_chip.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

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
                backgroundColor: AppColors.current.primary,
                backgroundImage: controller.profile,
                radius: 25.0,
              ),
              Expanded(
                child: Padding(
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
                ),
              ),
              controller.isMine
                  ? OptionButton(
                      options: ['수정', '삭제'],
                      onSelected: (idx) {
                        idx == 0 ? controller.fix() : controller.delete();
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        Container(
          color: Colors.grey[200],
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1 / 1,
              viewportFraction: 1,
              initialPage: controller.imageIndex,
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
        buildTags(),
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
            padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                            ? 7
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
                              ? AppColors.current.primary
                              : AppColors.subtitleColor.withOpacity(0.2)),
                    );
                  }).toList(),
                )),
          )
        : const SizedBox.shrink();
  }

  Widget buildTags() {
    return controller.students.length > 0
        ? Container(
            margin: EdgeInsets.fromLTRB(
                16, controller.images.length > 1 ? 0 : 8, 16, 0),
            child: Wrap(
              children: controller.students
                  .map((e) => Transform.scale(
                      scale: 0.9, child: StudentChip(name: e.name!)))
                  .toList(),
            ),
          )
        : const SizedBox.shrink();
  }
}
