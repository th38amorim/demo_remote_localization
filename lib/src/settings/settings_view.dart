import 'package:flutter/material.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppLocalizations.of(context)!.settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ExpansionTile(
            title: Text('AppLocalizations.of(context)!.theme'),
            trailing: Icon(
              controller.themeMode == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            children: [
              ListTile(
                onTap: controller.themeMode == ThemeMode.light
                    ? null
                    : () => controller.updateThemeMode(ThemeMode.light),
                title: Text('AppLocalizations.of(context)!.lightTheme'),
                trailing: controller.themeMode == ThemeMode.light
                    ? const Icon(Icons.check_circle)
                    : null,
              ),
              ListTile(
                onTap: controller.themeMode == ThemeMode.dark
                    ? null
                    : () => controller.updateThemeMode(ThemeMode.dark),
                title: Text('AppLocalizations.of(context)!.darkTheme'),
                trailing: controller.themeMode == ThemeMode.dark
                    ? const Icon(Icons.check_circle)
                    : null,
              ),
            ],
          ),
          ExpansionTile(
            title: Text('AppLocalizations.of(context)!.language'),
            trailing: Text(controller.locale.languageCode.toUpperCase()),
            // children: AppLocalizations.supportedLocales.map(
            //   (e) => ListTile(
            //     onTap: controller.locale == e
            //         ? null
            //         : () => controller.updateLocale(e),
            //     title: Text(e.languageCode.toUpperCase()),
            //     trailing: controller.locale == e
            //         ? const Icon(Icons.check_circle)
            //         : null,
            //   ),
            // ).toList(),
          ),
        ],
      ),
    );
  }
}
