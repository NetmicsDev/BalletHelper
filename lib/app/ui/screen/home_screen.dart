import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/menu_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends GetView<MainController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        elevation: 0,
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        child: Center(
          child: Text('MENU'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(height: Get.height * 0.2),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildHeader({double? height}) {
    final userData = controller.userData;
    final _height = height ?? Get.height / 5;
    return Container(
      color: AppColors.primaryColor,
      height: _height,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 12.0),
            child: Text(
              userData.academyName ?? '',
              style: TextStyles.academyNameStyle,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 12.0, bottom: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      userData.name ?? '',
                      style: TextStyles.brightContentStyle,
                    ),
                    const Text(
                      // 두개 이상 같은 fontSize로 있어야 baseline이 작동함
                      '',
                      style: TextStyles.brightContentStyle,
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: _height / 2 - 6,
                  backgroundColor: Colors.white,
                  backgroundImage: userData.profileData as ImageProvider,
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin: const EdgeInsets.only(left: 12.0, bottom: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  userData.branchName ?? '',
                  style: TextStyles.brightContentStyle,
                ),
                const SizedBox(width: 8),
                Text(
                  userData.className ?? '',
                  style: TextStyles.brightContentStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Container(
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.all(10.0),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double buttonSize = (constraints.maxWidth - 38) * 0.25;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenuButton(
                size: buttonSize,
                color: Color(0xff4EE3C6),
                title: '알림장',
                assetPath: '',
                routeName: '',
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xffFFA42D),
                title: '앨범',
                assetPath: '',
                routeName: '',
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xffE74ACD),
                title: 'AI',
                assetPath: '',
                routeName: '',
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xff309AAB),
                title: '소개',
                assetPath: '',
                routeName: '',
              ),
            ],
          );
        }));
  }
}
