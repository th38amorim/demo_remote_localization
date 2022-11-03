class LanguageOptions {
  final String? language;
  final String? text;

  LanguageOptions({
    this.language, 
    this.text,
  });

  static List<LanguageOptions> fromJsonList(List<dynamic> jsonMap) {
    List<LanguageOptions> languageOptionsList = [];

    for (var i = 0; i < jsonMap.length; i++) {
      LanguageOptions languageOption = LanguageOptions(
        language: jsonMap[i]['language'], 
        text: jsonMap[i]['text'],
      );
      languageOptionsList.add(languageOption);
    }
    return languageOptionsList;
  }
}

class AppLocalizationsModel {
  final String? tag;
  final String? standard;
  final List<LanguageOptions>? languageOptions;

  AppLocalizationsModel({
    this.tag,
    this.standard,
    this.languageOptions,
  });

  static List<AppLocalizationsModel> fromJsonList(List<dynamic> jsonMap) {
    List<AppLocalizationsModel> appLocalizationsList = [];

    for (var i = 0; i < jsonMap.length; i++) {
      AppLocalizationsModel languageOption = AppLocalizationsModel(
        tag: jsonMap[i]['tag'], 
        standard: jsonMap[i]['standard'],
        languageOptions: LanguageOptions.fromJsonList(jsonMap[i]['language_options'])
      );
      appLocalizationsList.add(languageOption);
    }
    return appLocalizationsList;
  }

  // factory AppLocalizationsModel.fromJson(Map<String, dynamic> json) {
  //   return AppLocalizationsModel(
  //       tag: json['tag'],
  //       standard: json['standard'],
  //       languageOptions: LanguageOptions.fromJsonList(json['language_options'])
  //   );

}