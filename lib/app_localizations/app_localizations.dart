// ignore_for_file: file_names

import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class  AppLocalizations {
  AppLocalizations(this.context);
  
  final BuildContext context;
  final remoteConfig = FirebaseRemoteConfig.instance;

  late Locale myLocale = Localizations.localeOf(context);
  
  Map<String, dynamic> get enUS => jsonDecode(remoteConfig.getString('pt_BR'));

  String get appBarTitle => enUS['appbar_title'];
  String get hello => enUS['hello'];
  String get welcome => enUS['welcome'];
  String get yourName => enUS['yourName'];
  String get aboutYou => enUS['aboutYou'];
}