import 'package:flutter/material.dart';

/// Representation of a tab item in a [ScaffoldWithNavBar]
class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  /// Constructs an [ScaffoldWithNavBarTabItem].
  const ScaffoldWithNavBarTabItem({
    required this.initialLocation,
    required Widget icon,
    required Widget activeIcon,
    String? label,
  }) : super(icon: icon, label: label, activeIcon: activeIcon);

  /// The initial location/path
  final String initialLocation;
}
