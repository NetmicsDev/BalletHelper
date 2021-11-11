import 'package:ballet_helper/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'app/routes/pages.dart';

void main() async {
  runApp(const MyApp());
}

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: Routes.HOME,
      getPages: Pages.pages,
    );
  }
}
