import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import '../home/home_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  static const routeName = '/home';

  final ValueNotifier<bool> obscure = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(const Size.square(128)),
                    child: const FlutterLogo()
                  ),
                ),
                const SizedBox(height: 12),
                const Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'my',
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        TextSpan(
                          text: 'goals',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 60),
                Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.loose(const Size.fromWidth(600)),
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(height: 1.6),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        labelText: AppLocalizations(context).email,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: obscure,
                  builder: (context, obscureText, _) => Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(const Size.fromWidth(600)),
                      child: TextFormField(
                        obscureText: obscureText,
                        maxLines: 1,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                          height: 1.6,
                          letterSpacing: obscureText ? 2.0 : null,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: AppLocalizations(context).password,
                          labelStyle: const TextStyle(letterSpacing: 0),
                          suffixIcon: IconButton(
                            onPressed: () => obscure.value = !obscure.value,
                            icon: Icon(
                              obscureText ? Icons.visibility : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
                  onPressed: () => toast(context, AppLocalizations(context).forgotPassword),
                  child: Text(AppLocalizations(context).forgotPassword),
                ),
                const SizedBox(height: 48),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 56),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(64),
                      ),
                      backgroundColor: Colors.teal.shade200,
                      foregroundColor: Colors.black87,
                    ),
                    onPressed: () => goHome(context),
                    child: Text(AppLocalizations(context).login),
                  ),
                ),
                const SizedBox(height: 48),
                Text(
                  AppLocalizations(context).dontHaveAccount,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption!.apply(
                        color: Colors.grey.shade700,
                      ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: () => toast(
                    context,
                    AppLocalizations(context).createAccount,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppLocalizations(context).createAccount),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void goHome(BuildContext context) {
    Navigator.of(context).pushNamed(HomeView.routeName);
  }

  void toast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
