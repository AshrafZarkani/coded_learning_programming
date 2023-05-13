import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_programming/core/constants/constants.dart';
import 'package:learn_programming/modules/class_details/screen/class_details.dart';
import 'package:learn_programming/modules/courses/lectures_screen.dart';
import 'package:learn_programming/modules/discusion/discusions_screen.dart';
import 'package:learn_programming/modules/exception/views/not_found_page.dart';
import 'package:learn_programming/modules/home/view/bottom_navbar_view.dart';
import 'package:learn_programming/modules/home/widgets/tabs.dart';
import 'package:learn_programming/modules/journy/screen/journy_screen.dart';
import 'package:learn_programming/modules/profile/profile_screen.dart';

///[_rootNavigatorKey] used for global | general navigation
final _rootNavigatorKey = GlobalKey<NavigatorState>();

///[_shellNavigatorKey] used for nesting routes within bottom nav bar (stickey bottom nav bar)
final _shellNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundPage();

  /// use this in [MaterialApp.router]
  static final _router = GoRouter(
    initialLocation: NamedRoutes.lectures,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(
            tabs: BottomNavBarTabs.tabs(context),
            child: child,
          );
        },
        routes: [
          // Leactures
          GoRoute(
            path: NamedRoutes.lectures,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const LecturesScreen(),
            ),
          ),
          // Discusions
          GoRoute(
            path: NamedRoutes.discusions,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const DiscusionsScreen(),
            ),
          ),
          // journy
          GoRoute(
            path: NamedRoutes.journy,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const JournyScreen(),
            ),
          ),
          // profile
          GoRoute(
            path: NamedRoutes.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
      // class detials
      /// outside the [ShellRoute] to make the screen on top of the [BottomNavBar]
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: NamedRoutes.classDetails,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const ClassDetails(),
        ),
      ),
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}
