import 'package:flutter/material.dart';
import 'package:uptask/core/core.dart';
import 'package:uptask/presentation/auth/widgets/auth_form_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppConstant.appName,
              style: AppTypography.headline3.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            AuthFormWidget(),
            Text(
              'Copyright © ${DateTime.now().year}',
              style: AppTypography.headline6.copyWith(
                color: Colors.grey,
              ),
            ),
          ],
        ).withSpacing(48),
      ),
    );
  }
}
