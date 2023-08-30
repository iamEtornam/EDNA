import 'package:edna_app/router.dart';
import 'package:edna_app/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'EDNA.ai',
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme:customLightTheme(context),
      darkTheme: customDarkTheme(context),
      themeMode: ThemeMode.system,
    );
  }
}
