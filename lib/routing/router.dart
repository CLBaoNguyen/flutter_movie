import 'package:flutter/material.dart';
import 'package:flutter_movie/routing/routes.dart';
import 'package:flutter_movie/ui/favorite/favorite_screen.dart';
import 'package:flutter_movie/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../ui/home/view_models/home_viewmodel.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (BuildContext context, GoRouterState state) {
                final viewModel = HomeViewModel(
                  movieRepository: context.read(),
                );
                return HomeScreen(viewModel: viewModel);
              },
              routes: <RouteBase>[],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.favorite,
              builder: (BuildContext context, GoRouterState state) {
                return const FavoriteScreen();
              },
              routes: <RouteBase>[],
            ),
          ],
        ),
      ],
    ),
  ],
);
