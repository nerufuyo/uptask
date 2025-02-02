import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptask/core/core.dart';

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
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<SplashBloc>()..add(SplashStarted()),
        child: SplashScreen(),
      ),
    ),
    GoRoute(
      path: RoutePath.auth,
      name: ScreenName.auth,
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: AuthScreen(),
      ),
    ),
    GoRoute(
      path: RoutePath.home,
      name: ScreenName.home,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
