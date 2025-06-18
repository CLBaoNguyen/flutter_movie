import 'package:flutter/material.dart';
import 'package:flutter_movie/routing/routes.dart';
import 'package:flutter_movie/ui/detail/detail_screen.dart';
import 'package:flutter_movie/ui/favorite/widgets/favorite_screen.dart';
import 'package:flutter_movie/ui/home/widgets/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/services/api/model/movie.dart';
import '../main.dart';
import '../ui/favorite/view_models/favorite_viewmodel.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/search/widgets/search_screen.dart';

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
    GoRoute(
      path: Routes.detail,
      builder: (context, state) {
        return DetailScreen(movie: state.extra as Movie);
      },
    ),
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
                  movieRepository: context.read()
                );
                return HomeScreen(viewModel: viewModel);
              },
              routes: <RouteBase>[
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: Routes.search,
                  builder: (BuildContext context, GoRouterState state) {
                    return SearchScreen(searchViewModel: context.read());
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.favorite,
              builder: (BuildContext context, GoRouterState state) {
                final viewModel = FavoriteViewModel(movieRepository: context.read());
                return FavoriteScreen(viewModel: viewModel);
              },
              routes: <RouteBase>[],
            ),
          ],
        ),
      ],
    ),
  ],
);
