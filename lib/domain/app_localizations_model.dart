class AppLocalizationsModel {

  final Map<String, dynamic>? email;
  final Map<String, dynamic>? password;

  AppLocalizationsModel({
    this.email,
    this.password,
  });

  factory AppLocalizationsModel.fromJson(Map<String, dynamic> json) {
    return AppLocalizationsModel(
      email: {
         "standard": "E-mail",
          "language": {
            "pt_BR": "E-mail",
            "en_US": "Email",
          },
      }, 
      password: {
        'standard': 'Password',
        "password": {
          "en_US": "Password",
          "pt_BR": "Senha"
        }, 
      },
    );
  }

}