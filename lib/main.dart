import 'package:demo_remote_localization/app_localizations/app_localizations.dart';
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
    return MaterialApp(
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
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
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));
    await remoteConfig.fetchAndActivate();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations(context).hello),
        centerTitle: true,
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations(context).appBarTitle,
                    style: const TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations(context).welcome,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations(context).yourName,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations(context).aboutYou,
                    style: const TextStyle(fontSize: 28),
                  ),
                ],
              ),
      ),
    );
  }
}
