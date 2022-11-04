class AppLocalizationsModel {
  
  final String demoRemote;
  final String startDemo;
  final String hello;
  final String welcome;

  AppLocalizationsModel({
    this.demoRemote = '',
    this.startDemo = '',
    this.hello = '',
    this.welcome = '',
  });

  factory AppLocalizationsModel.fromJson(Map<String, dynamic> json) {
    return AppLocalizationsModel(
      demoRemote: json['demoRemote'],
      startDemo: json['startDemo'],
      hello: json['hello'],
      welcome: json['welcome'],
    );
  }
  
}