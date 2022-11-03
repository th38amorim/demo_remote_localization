// ignore_for_file: avoid_print

import 'dart:convert';

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
      create:(context) => RepositoryProvider<AppLocalizationsRepository>(create: (context) => AppLocalizationsRepository()),
      child: const HomePage(),
    ),
  );
}