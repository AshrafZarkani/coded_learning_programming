import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';
import 'package:learn_programming/modules/home/helper/scaffold_navbar_item.dart';

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar(
      {Key? key, required this.child, required this.tabs})
      : super(key: key);
  final Widget child;
  final List<ScaffoldWithNavBarTabItem> tabs;

  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int _locationToTabIndex(String location) {
    final index =
        widget.tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int tabIndex) {
    // Only navigate if the tab index has changed
    if (tabIndex != _currentIndex) {
      context.go(widget.tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: widget.tabs,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyAppColors.blue,
        showUnselectedLabels: true,
        unselectedItemColor: MyAppColors.grey,
        selectedIconTheme: const IconThemeData(color: MyAppColors.blue),
        unselectedIconTheme: const IconThemeData(color: MyAppColors.grey),
        selectedLabelStyle:
            context.textTheme.bodyMedium?.copyWith(color: MyAppColors.blue),
        unselectedLabelStyle:
            context.textTheme.bodyMedium?.copyWith(color: MyAppColors.grey),
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
