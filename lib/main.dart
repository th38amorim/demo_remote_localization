import 'package:demo_remote_localization/src/app/app.dart';
import 'package:demo_remote_localization/src/home/home_controller.dart';
import 'package:demo_remote_localization/src/home/home_service.dart';
import 'package:demo_remote_localization/src/settings/settings_controller.dart';
import 'package:demo_remote_localization/src/settings/settings_service.dart';

import '../app_localizations.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final remoteConfig = FirebaseRemoteConfig.instance;

  bool _isLoading = false;

  @override
  void initState() {
    _forceFetch();
    super.initState();
  }

  void _forceFetch() async {
    setState(() => _isLoading = true);
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(milliseconds: 2),
      minimumFetchInterval: Duration.zero,
    ));
    await remoteConfig.fetchAndActivate();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {

    final settingsController = SettingsController(SettingsService());
    final homeController = HomeController(HomeService());

    settingsController.loadSettings();
    homeController.initialize(context);

    return Scaffold(
      body: Center(
        child: _isLoading ? const CircularProgressIndicator() : ElevatedButton(
          child: Text(AppLocalizations(context).startDemo),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAppDemo(
                  settingsController: settingsController, 
                  homeController: homeController,
                )),
              );
          }
        ),
      ),
    );
  }
}
