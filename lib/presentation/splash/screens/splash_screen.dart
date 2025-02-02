import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/presentation/presentation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToNextScreen(BuildContext context) async {
    String? token =
        await FlutterSecureStorage().read(key: AppConstant.tokenName);

    if (token != null && token.isNotEmpty) {
      GoRouter.of(globalKey.currentContext!).go(RoutePath.home);
    } else {
      GoRouter.of(globalKey.currentContext!).go(RoutePath.auth);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashSuccess) _navigateToNextScreen(context);
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
