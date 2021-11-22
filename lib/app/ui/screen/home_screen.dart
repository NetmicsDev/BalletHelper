import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/menu_button.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends GetView<MainController> {
  HomeScreen({Key? key}) : super(key: key);

  double toolbarHeight = 40;
  double headerHeight = Get.height * 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: toolbarHeight,
        elevation: 0,
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: buildDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(),
          buildButtons(),
          buildGallery(),
        ],
      ),
    );
  }

  Widget buildDrawer() {
    late String userType;
    switch (controller.userType) {
      case UserType.parent:
        userType = Strings.parent;
        break;
      case UserType.teacher:
        userType = Strings.teacher;
        break;
      case UserType.owner:
        userType = Strings.owner;
        break;
    }
    return Container(
      width: Get.width * 0.75,
      color: AppColors.secondaryColor,
      child: Column(
        children: [
          Container(
              color: AppColors.primaryColor,
              height: toolbarHeight + headerHeight,
              child: Center(
                  child: Text(
                userType,
                style: TextStyles.buttonDarkTitleStyle,
              ))),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NavigateButton(title: '아이 정보 보기'),
                NavigateButton(title: 'FAQ'),
                NavigateButton(title: '권한 전환'),
                NavigateButton(title: '탈퇴'),
                NavigateButton(title: '약관'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildHeader({double? height}) {
    final userData = controller.userData;
    return Container(
      color: AppColors.primaryColor,
      height: headerHeight,
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
                  radius: headerHeight / 2 - 6,
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
                routeName: Routes.notice,
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xffFFA42D),
                title: '앨범',
                assetPath: '',
                routeName: Routes.album,
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

  Widget buildGallery() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: controller.imageList.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: controller.imageList[index].imageData as ImageProvider,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }
}
