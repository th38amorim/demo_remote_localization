import 'package:flutter/material.dart';

import 'settings_service.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  final SettingsService _settingsService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  late Locale _locale;
  Locale get locale => _locale;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _locale = await _settingsService.locale();

    notifyListeners();
  }

  Future<void> updateLocale(Locale? newLocale) async {
    if ((newLocale ?? _locale) == _locale) return;

    _locale = newLocale!;

    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if ((newThemeMode ?? _themeMode) == _themeMode) return;

    _themeMode = newThemeMode!;

    notifyListeners();
  }
}
