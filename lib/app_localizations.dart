import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class  AppLocalizations {
  AppLocalizations(this.context);
  
  final BuildContext context;
  final remoteConfig = FirebaseRemoteConfig.instance;

  late Locale myLocale = Localizations.localeOf(context);
  
  Map<String, dynamic> get applocalizations => jsonDecode(remoteConfig.getString('en_US'));

  String get startDemo => applocalizations["startDemo"] ?? "";
  String get email => applocalizations["email"] ?? "";
  String get password => applocalizations["password"] ?? "";
  String get login => applocalizations["login"] ?? "";
  String get forgotPassword => applocalizations["forgotPassword"] ?? "";
  String get createAccount => applocalizations["createAccount"] ?? "";
  String get dontHaveAccount => applocalizations["dontHaveAccount"] ?? "";
  String get home => applocalizations["home"] ?? "";
  String get explore => applocalizations["explore"] ?? "";
  String get goals => applocalizations["goals"] ?? "";
  String get profile => applocalizations["profile"] ?? "";
  String get beActive => applocalizations["beActive"] ?? "";
  String get goForWalk => applocalizations["goForWalk"] ?? "";
  String get readAtNight => applocalizations["readAtNight"] ?? "";
  String get cookDinner => applocalizations["cookDinner"] ?? "";
  String get organizeWork => applocalizations["organizeWork"] ?? "";
  String get practiceFrench => applocalizations["practiceFrench"] ?? "";
  String get twoADay => applocalizations["twoADay"] ?? "";
  String get fiveADay => applocalizations["fiveADay"] ?? "";
  String get threeAWeek => applocalizations["threeAWeek"] ?? "";
  String get oneADay => applocalizations["oneADay"] ?? "";
  String get oneAWeek => applocalizations["oneAWeek"] ?? "";
  String get twoAWeek => applocalizations["twoAWeek"] ?? "";
  String get progress => applocalizations["progress"] ?? "";
  String get percent => applocalizations["percent"] ?? "";
}