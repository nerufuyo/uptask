import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptask/presentation/splash/bloc/splash_bloc.dart';

import '../../../core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) GoRouter.of(context).go(RoutePath.home);
      },
      child: Scaffold(
        body: Center(
          child: Text(
            AppConstant.appName,
            style: AppTypography.headline2.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
