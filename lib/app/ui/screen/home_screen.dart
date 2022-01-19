import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/controller/home_controller.dart';
import 'package:ballet_helper/app/data/dummy_datas.dart';
import 'package:ballet_helper/app/data/model/parent_model.dart';
import 'package:ballet_helper/app/data/model/user_model.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:ballet_helper/app/ui/theme/styles/text_styles.dart';
import 'package:ballet_helper/app/ui/values/strings.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/menu_button.dart';
import 'package:ballet_helper/app/ui/widgets/buttons/navigate_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);

  double toolbarHeight = 40;
  double headerHeight = Get.height * 0.2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.current.primary,
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
    List<NavigateButton> privateButtons = [];
    switch (controller.userType) {
      case UserType.parent:
        userType = Strings.parent;
        privateButtons.add(NavigateButton(
          title: '가족 정보 관리',
          onPressed: () => Get.toNamed(Routes.family),
        ));
        break;
      case UserType.teacher:
        userType = Strings.teacher;
        privateButtons.add(NavigateButton(
          title: '원생 관리',
          onPressed: () => Get.toNamed(Routes.student),
        ));
        break;
      case UserType.owner:
        userType = Strings.owner;
        privateButtons.add(NavigateButton(
          title: '학원 관리',
          onPressed: () => Get.toNamed(Routes.academy),
        ));
        privateButtons.add(NavigateButton(
          title: '교사 관리',
          onPressed: () => Get.toNamed(Routes.teacher),
        ));
        privateButtons.add(NavigateButton(
          title: '원생 관리',
          onPressed: () => Get.toNamed(Routes.student),
        ));
        break;
    }
    return Container(
      width: Get.width * 0.75,
      color: AppColors.current.secondary,
      child: Column(
        children: [
          Container(
              color: AppColors.current.primary,
              height: toolbarHeight + headerHeight,
              child: Center(
                  child: Text(
                '$userType 메뉴',
                style: TextStyles.buttonDarkTitleStyle
                    .copyWith(color: AppColors.current.primaryDark),
              ))),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NavigateButton(
                  title: '내 정보',
                  onPressed: () => Get.toNamed(Routes.myPage),
                ),
                ...privateButtons,
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

    String academyName = DummyDatas.academyNames[controller.academyId]!;

    return Container(
      color: AppColors.current.primary,
      height: headerHeight,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  academyName,
                  style: TextStyles.academyNameStyle,
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      controller.branchName is List<String>
                          ? controller.branchName!.isNotEmpty
                              ? controller.branchName![0]
                              : '-'
                          : controller.branchName,
                      style: TextStyles.brightContentStyle,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.className is List<String>
                          ? controller.className!.isNotEmpty
                              ? controller.className![0]
                              : '-'
                          : controller.className,
                      style: TextStyles.brightContentStyle,
                    ),
                  ],
                ),
              ],
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
                      controller.userName,
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
                  backgroundImage: userData.profileData,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtons() {
    return Container(
        color: AppColors.current.secondary,
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
                assetPath: 'assets/images/알림장.png',
                routeName: Routes.notice,
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xffFFA42D),
                title: '앨범',
                assetPath: 'assets/images/앨범.png',
                routeName: Routes.album,
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xffE74ACD),
                title: 'AI',
                assetPath: 'assets/images/AI.png',
                routeName: '',
              ),
              MenuButton(
                size: buttonSize,
                color: Color(0xff309AAB),
                title: '소개',
                assetPath: 'assets/images/소개.png',
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
