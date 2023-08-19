import 'package:edna_app/about_view.dart';
import 'package:edna_app/chat_view.dart';
import 'package:edna_app/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesName {
  static const String initialRoute = '/';
  static const String chat = '/chat';
  static const String about = '/about';
}

final GoRouter router =
    GoRouter(debugLogDiagnostics: kDebugMode, initialLocation: RoutesName.initialRoute, routes: [
  GoRoute(
      path: '/',
      name: RoutesName.initialRoute,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const SplashView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      }),
  GoRoute(
      path: '/chat',
      name: RoutesName.chat,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const ChatView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      }),
  GoRoute(
      path: '/about',
      name: RoutesName.about,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const AboutView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      }),
]);
