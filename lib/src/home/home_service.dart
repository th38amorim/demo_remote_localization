import 'package:demo_remote_localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'models/home_item.dart';
import 'models/home_navigation_item.dart';

class HomeService {
  Future<List<HomeItem>> loadItems(BuildContext context) async {
    return [
      HomeItem(
        icon: const Icon(Icons.run_circle_outlined, size: 32),
        title: AppLocalizations(context).beActive,
        subtitle: AppLocalizations(context).twoADay,
        color: Colors.purple,
      ),
      HomeItem(
        icon: const Icon(Icons.roundabout_left_outlined, size: 32),
        title: AppLocalizations(context).goForWalk,
        subtitle: AppLocalizations(context).fiveADay,
        color: Colors.red.shade300,
      ),
      HomeItem(
        icon: const Icon(Icons.menu_book_outlined, size: 32),
        title: AppLocalizations(context).readAtNight,
        subtitle: AppLocalizations(context).threeAWeek,
        color: Colors.orange,
      ),
      HomeItem(
        icon: const Icon(Icons.dinner_dining_sharp, size: 32),
        title: AppLocalizations(context).cookDinner,
        subtitle: AppLocalizations(context).oneADay,
        color: Colors.lightBlue,
      ),
      HomeItem(
        icon: const Icon(Icons.work_outline_outlined, size: 32),
        title: AppLocalizations(context).organizeWork,
        subtitle: AppLocalizations(context).oneAWeek,
        color: Colors.green.shade200,
      ),
      HomeItem(
        icon: const Icon(Icons.language_outlined, size: 32),
        title: AppLocalizations(context).practiceFrench,
        subtitle: AppLocalizations(context).twoAWeek,
        color: Colors.teal.shade200,
      ),
    ];
  }

  Future<List<HomeNavigationItem>> loadNavItems(BuildContext context) async {
    return [
      HomeNavigationItem(icon: Icons.home, label: AppLocalizations(context).home),
      HomeNavigationItem(icon: Icons.radar, label: AppLocalizations(context).explore),
      HomeNavigationItem(icon: Icons.star, label: AppLocalizations(context).goals),
      HomeNavigationItem(icon: Icons.person, label: AppLocalizations(context).profile),
    ];
  }
}
