// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:demo_remote_localization/domain/app_localizations_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizationsState {
  final List<AppLocalizationsModel> allRemoteStrings;

  AppLocalizationsState({this.allRemoteStrings = const []});
  
  AppLocalizationsState copyWith({
    List<AppLocalizationsModel> allRemoteStrings = const [],
  }) {
    return AppLocalizationsState(
      allRemoteStrings: allRemoteStrings,
    );
  }

} 

class AppLocalizationsCubit extends Cubit<AppLocalizationsState> {
  AppLocalizationsCubit() : super(AppLocalizationsState());

  void getRemoteStrings() async {
    final prefs = await SharedPreferences.getInstance();
    final allRemoteStrings = AppLocalizationsModel.fromJsonList(jsonDecode(prefs.getString('remoteStrings')!));
    emit(state.copyWith(allRemoteStrings: allRemoteStrings));
  }

  String getPortugueseStrings(String text) {
    if (state.allRemoteStrings.isNotEmpty) {
      for (var i = 0; i < state.allRemoteStrings.length; i++) {
        if (state.allRemoteStrings[i].tag == text) {
          for (var j = 0; j < state.allRemoteStrings[i].languageOptions!.length; j++) {
            if (state.allRemoteStrings[i].languageOptions![j].language == 'pt_BR') {
              return state.allRemoteStrings[i].languageOptions![j].text!;
            }
          }
        }
      }
    }
    return '';
  }
}