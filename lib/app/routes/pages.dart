import 'package:ballet_helper/app/routes/routes.dart';
import 'package:ballet_helper/app/ui/screens/sample_item_details_view.dart';
import 'package:ballet_helper/app/ui/screens/sample_item_list_view.dart';
import 'package:ballet_helper/app/ui/screens/settings_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.home, page: () => SampleItemListView()),
    GetPage(name: Routes.detail, page: () => const SampleItemDetailsView()),
    GetPage(name: Routes.setting, page: () => SettingsView()),
  ];
}
