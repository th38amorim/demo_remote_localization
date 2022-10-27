import 'package:flutter/material.dart';

import 'home_service.dart';
import 'models/home_item.dart';
import 'models/home_navigation_item.dart';

class HomeController with ChangeNotifier {
  HomeController(this._homeService);

  final HomeService _homeService;

  List<HomeItem> _items = [];
  List<HomeItem> get items => [..._items];

  List<HomeNavigationItem> _navItems = [];
  List<HomeNavigationItem> get navItems => [..._navItems];

  int _selectedIndex = 0;
  int get index => _selectedIndex;

  String get title => navItems[index].label;

  Future<void> initialize(BuildContext context) async {
    _items = await _homeService.loadItems(context);
    _navItems = await _homeService.loadNavItems(context);
    notifyListeners();
  }

  void updateSelectedIndex(int? newIndex, [bool notify = true]) {
    if (newIndex == null) return;

    if (newIndex == _selectedIndex) return;

    _selectedIndex = newIndex;
    
    if (notify) notifyListeners();
  }
}
