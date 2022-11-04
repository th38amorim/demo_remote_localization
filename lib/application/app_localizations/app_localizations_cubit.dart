import 'dart:convert';

import 'package:demo_remote_localization/infrastructure/app_localizations_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizationsState {
  final Map<String, dynamic> allRemoteStrings;

  AppLocalizationsState({required this.allRemoteStrings});
  
  AppLocalizationsState copyWith({
    Map<String, dynamic> allRemoteStrings = const {},
  }) {
    return AppLocalizationsState(
      allRemoteStrings: allRemoteStrings,
    );
  }
} 

class AppLocalizationsCubit extends Cubit<AppLocalizationsState> {
  AppLocalizationsCubit() : super(AppLocalizationsState(allRemoteStrings: {}));

  late AppLocalizationsRepository appLocalizationsRepository;

  void getRemoteStrings() async {
    final prefs = await SharedPreferences.getInstance();
    final allRemoteStrings = jsonDecode(prefs.getString('remoteStrings')!);
    emit(state.copyWith(allRemoteStrings: allRemoteStrings));
  }
}