import 'package:flutter/material.dart';
import 'package:uptask/core/core.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: MediaQuery.of(context).size.height * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppConstant.appName,
              style: AppTypography.headline3.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Copyright © ${DateTime.now().year}',
              style: AppTypography.headline6.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
