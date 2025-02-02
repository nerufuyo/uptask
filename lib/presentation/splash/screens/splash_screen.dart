import 'package:flutter/material.dart';
import 'package:uptask/core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppConstant.appName,
          style: AppTypography.headline2.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
