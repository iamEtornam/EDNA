import 'package:edna_app/UI/chat_view.dart';
import 'package:edna_app/UI/splash_view.dart';
import 'package:edna_app/ui/about_view.dart';
import 'package:edna_app/ui/welcome_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutesName {
  static const String initialRoute = '/';
  static const String chat = '/chat';
  static const String about = '/about';
  static const String welcome = '/welcome';
}

final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: RoutesName.initialRoute,
    routes: [
      GoRoute(
          path: '/',
          name: RoutesName.initialRoute,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const SplashView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          path: '/welcome',
          name: RoutesName.welcome,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: WelcomeView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
          path: '/chat',
          name: RoutesName.chat,
          pageBuilder: (BuildContext context, GoRouterState state) {
            final arg = state.extra as String;
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChatView(name: arg),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
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
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: CurveTween(curve: Curves.easeInOutCirc)
                      .animate(animation),
                  child: child,
                );
              },
            );
          }),
    ]);
