import 'package:flutter/material.dart';
import 'package:flutter_movie/routing/router.dart';
import 'package:flutter_movie/ui/core/themes/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'config/dependencies.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: AppColors.lightColorScheme,
      ),
      routerConfig: router,
    );
  }
}

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: _isSelected(0)
                ? Icon(Icons.home, color: Colors.amberAccent)
                : Icon(Icons.home_outlined),
            label: '',
          ),
          NavigationDestination(
            icon: _isSelected(1)
                ? Icon(Icons.favorite, color: Colors.amberAccent)
                : Icon(Icons.favorite_border),
            label: '',
          ),
        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  bool _isSelected(int index) {
    return navigationShell.currentIndex == index;
  }
}
