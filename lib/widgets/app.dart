import 'package:ballet_helper/widgets/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SampleItemListView()),
        GetPage(name: '/detail/:id', page: () => const SampleItemDetailsView()),
        GetPage(
            name: '/setting',
            page: () => SettingsView(
                controller: SettingsController(SettingsService()))),
      ],
    );
  }
}
