import 'package:demo_remote_localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';
import 'widgets/home_item_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.controller,
  });

  static const routeName = '/home';

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations(context).home),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.95,
            ),
            itemCount: controller.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = controller.items[index];
              return HomeItemWidget(item: item, icon: item.icon);
            },
          ),
        bottomNavigationBar: Container(
          clipBehavior: Clip.antiAlias,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
            currentIndex: controller.index,
            backgroundColor: Colors.transparent,
            onTap: (value) {
              if (controller.index == value) return;
              controller.updateSelectedIndex(value);
            },
            items: controller.navItems
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: Icon(e.icon),
                    label: e.label,
                    backgroundColor:
                        Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                  ),
                ).toList(),
          ),
        ),
    );
  }
}
