// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:demo_remote_localization/domain/app_localizations_model.dart';
import 'package:demo_remote_localization/home/home_page.dart';
import 'package:demo_remote_localization/infrastructure/app_localizations_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final getRemoteStrings = await AppLocalizationsRepository().getAppLocalizations();
  await prefs.setString('remoteStrings', jsonEncode(getRemoteStrings));

  runApp(
    RepositoryProvider(
      create:(context) => AppLocalizationsRepository(),
      child: MaterialApp(
        home: TestLocalization(
          appLocalizations: AppLocalizationsModel.fromJson(getRemoteStrings),
          child: const HomePage(),
        ),
      ),
    ),
  );
}

class TestLocalization extends InheritedWidget {
  const TestLocalization({super.key, required super.child, required this.appLocalizations});

  final AppLocalizationsModel appLocalizations;

  static TestLocalization of(BuildContext context) {
    final TestLocalization? result = context.dependOnInheritedWidgetOfExactType<TestLocalization>();
    
    assert(result != null, 'No TestLocalization Found In Context');

    return result!;
  }

  @override
  bool updateShouldNotify(covariant TestLocalization oldWidget) {
    return appLocalizations != oldWidget.appLocalizations;
  }
  
}