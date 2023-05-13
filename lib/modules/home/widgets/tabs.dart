import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_programming/core/constants/assets_path.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:learn_programming/core/extensions/build_context_x.dart';
import 'package:learn_programming/modules/home/helper/scaffold_navbar_item.dart';

///[BottomNavBarTabs] custome bottom nabe bar items class
abstract class BottomNavBarTabs {
  static List<ScaffoldWithNavBarTabItem> tabs(BuildContext context) {
    return [
      ScaffoldWithNavBarTabItem(
        initialLocation: NamedRoutes.lectures,
        icon: SvgPicture.asset(MyAssetsPath.classes),
        label: context.translate.lectures,
        activeIcon: SvgPicture.asset(
          MyAssetsPath.classes,
          colorFilter: const ColorFilter.mode(
            MyAppColors.blue,
            BlendMode.srcIn,
          ),
        ),
      ),
      ScaffoldWithNavBarTabItem(
        initialLocation: NamedRoutes.journy,
        icon: SvgPicture.asset(MyAssetsPath.journy),
        label: context.translate.journy,
        activeIcon: SvgPicture.asset(
          MyAssetsPath.journy,
          colorFilter:
              const ColorFilter.mode(MyAppColors.blue, BlendMode.srcIn),
        ),
      ),
      ScaffoldWithNavBarTabItem(
        initialLocation: NamedRoutes.discusions,
        icon: SvgPicture.asset(MyAssetsPath.discussion),
        label: context.translate.discussions,
        activeIcon: SvgPicture.asset(
          MyAssetsPath.discussion,
          colorFilter:
              const ColorFilter.mode(MyAppColors.blue, BlendMode.srcIn),
        ),
      ),
      ScaffoldWithNavBarTabItem(
        initialLocation: NamedRoutes.profile,
        icon: SvgPicture.asset(MyAssetsPath.profile),
        label: context.translate.profile,
        activeIcon: SvgPicture.asset(
          MyAssetsPath.profile,
          colorFilter:
              const ColorFilter.mode(MyAppColors.blue, BlendMode.srcIn),
        ),
      ),
    ];
  }
}
