import 'package:demo_remote_localization/application/app_localizations/app_localizations_cubit.dart';
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
          return MaterialApp(
            builder: (context, child) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(context.read<AppLocalizationsCubit>().getPortugueseStrings('demo')),
                  centerTitle: true,
                ),
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Demo'),
                  ),
                )
              );
            },
          );
        },
      ),
    );
  }
}