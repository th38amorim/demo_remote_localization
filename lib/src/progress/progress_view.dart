import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import 'progress_controller.dart';
import 'widgets/progress_view_mobile.dart';

import '../home/home_view.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
    required this.controller,
  });

  static const routeName = '/progress';

  final ProgressController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations(context).progress),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(36),
        child: LayoutBuilder(
          builder: (context, constraints) => ProgressViewMobile(controller: controller),
        ),
      ),
      bottomNavigationBar: Hero(
        tag: 'bottomnav',
        child: Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex,
            backgroundColor: Colors.transparent,
            onTap: (value) {
              if (controller.selectedIndex == value) return;

              Navigator.of(context).pushNamedAndRemoveUntil(
                HomeView.routeName,
                (route) => route.isFirst,
                arguments: value,
              );
            },
            items: controller.navItems
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label,
                    backgroundColor:
                        Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  String formatProgress(double value) {
    var progress = (value * 100).clamp(0, 100).toStringAsFixed(1);
    return "$progress%";
  }
}
