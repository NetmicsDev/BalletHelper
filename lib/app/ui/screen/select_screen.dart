import 'package:ballet_helper/app/controller/app_controller.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/academy_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectScreen extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            Strings.academySelect,
            style: TextStyles.buttonDarkTitleStyle,
          ),
        ),
        Expanded(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.academyList.length,
                        itemBuilder: (context, idx) {
                          final academy = controller.academyList[idx];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: AcademyButton(
                              title: academy.name,
                              content: academy.content,
                              image: academy.image,
                              imageWidth: 80,
                              color: academy.theme.primary,
                              onPressed: () => controller.goToHome(idx),
                            ),
                          );
                        })))))
      ],
    )));
  }
}
