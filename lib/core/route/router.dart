import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptask/core/route/route_path.dart';

import '../../presentation/presentation.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: globalKey,
  initialLocation: RoutePath.splash,
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  },
  routes: [
    GoRoute(
      path: RoutePath.splash,
      name: ScreenName.splash,
      builder: (context, state) => SplashScreen(),
    ),
  ],
);
