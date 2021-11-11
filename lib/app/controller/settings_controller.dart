import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController extends GetxController {
  SettingsController();

  // Make ThemeMode a private variable so it is not updated directly without
  // also persisting the changes with the SettingsService.
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;

  // Allow Widgets to read the user's preferred ThemeMode.
  ThemeMode get themeMode => _themeMode.value;

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // Otherwise, store the new theme mode in memory
    _themeMode.value = newThemeMode;

    // Important! Inform listeners a change has occurred.
    Get.changeThemeMode(newThemeMode);
  }
}
