import 'package:demo_remote_localization/application/app_localizations/app_localizations_cubit.dart';
import 'package:demo_remote_localization/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLocalizationsCubit()..getRemoteStrings(),
      child: BlocConsumer<AppLocalizationsCubit, AppLocalizationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                TestLocalization.of(context).appLocalizations.demoRemote,
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${TestLocalization.of(context).appLocalizations.hello}! ${TestLocalization.of(context).appLocalizations.welcome}' ,
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {}, 
                      child: Text(
                        TestLocalization.of(context).appLocalizations.startDemo,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          );
        },
      ),
    );
  }
}