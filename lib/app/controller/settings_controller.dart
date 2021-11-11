import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  SettingsController();

  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    _themeMode.value = newThemeMode;
    Get.changeThemeMode(newThemeMode);
  }
}
