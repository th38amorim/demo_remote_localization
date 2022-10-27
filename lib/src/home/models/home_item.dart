import 'package:flutter/widgets.dart';

class HomeItem {
  const HomeItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final Color color;
}
