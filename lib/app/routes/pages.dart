import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/screen/login/login_screen.dart';
import 'package:ballet_helper/app/ui/screen/login/user_type_page.dart';
import 'package:ballet_helper/app/ui/screen/preview_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(
        name: Routes.preview,
        page: () => PreviewScreen(),
        transition: Transition.fadeIn),
  ];
}
