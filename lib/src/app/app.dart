import 'package:flutter/material.dart';

import '../login/login_view.dart';
import '../home/home_controller.dart';
import '../home/home_view.dart';
import '../home/models/home_item.dart';
import '../progress/progress_view.dart';
import '../progress/progress_controller.dart';
import '../settings/settings_controller.dart';
import '../settings/settings_view.dart';

part 'app_theme.dart';

class MyAppDemo extends StatelessWidget {
  const MyAppDemo({
    super.key,
    required this.settingsController,
    required this.homeController,
  });

  final SettingsController settingsController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          locale: settingsController.locale,
          theme: theme,
          darkTheme: darkTheme,
          themeMode: settingsController.themeMode,
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case ProgressView.routeName:
                    var item = routeSettings.arguments as HomeItem;
                    var controller = ProgressController(
                      item: item,
                      navItems: homeController.navItems,
                      selectedIndex: homeController.index,
                    );

                    return ProgressView(controller: controller);
                  case HomeView.routeName:
                    if (routeSettings.arguments != null) {
                      int index = routeSettings.arguments as int;
                      homeController.updateSelectedIndex(index, false);
                    }
                    return HomeView(controller: homeController);
                  default:
                    return LoginView();
                }
              },
            );
          },
        );
      },
    );
  }
}
