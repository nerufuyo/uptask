import 'package:flutter/material.dart';
import 'package:uptask/core/core.dart';

void main() {
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
