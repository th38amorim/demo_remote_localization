import 'package:flutter/material.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async => ThemeMode.dark;
  Future<Locale> locale() async => const Locale('en','');

  Future<void> updateLocale(Locale locale) async {
    
  }
}
