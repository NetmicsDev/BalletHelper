import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/screen/login_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.login, page: () => LoginScreen()),
  ];
}
