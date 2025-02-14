import 'package:flutter/material.dart';
import 'package:parky/features/auth/presentation/pages/login_screen.dart';
import 'package:parky/features/splash/presentation/pages/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../features/auth/presentation/pages/sign_up_screen.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_screen1.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_screen2.dart';
import 'page_name.dart';

class RouteManager {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get ctx => navigatorKey.currentContext;

  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PageName.splash:
        return _getPageTransition(
          const SplashScreen(),
          settings: routeSettings,
        );

      case PageName.onBoarding1:
        return _getPageTransition(
          const OnBoardingScreen1(),
          settings: routeSettings,
        );

      case PageName.onBoarding2:
        return _getPageTransition(
          const OnBoardingScreen2(),
          settings: routeSettings,
        );

      case PageName.loginScreen:
        return _getPageTransition(
          const LoginScreen(),
          settings: routeSettings,
        );

      case PageName.signUpScreen:
        return _getPageTransition(
          const SignUpScreen(),
          settings: routeSettings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }

  // ignore: unused_element
  static PageTransition<dynamic> _getPageTransition(
    Widget screen, {
    RouteSettings? settings,
  }) {
    return PageTransition(
      child: screen,
      type: PageTransitionType.fade,
      curve: Curves.easeOut,
      reverseDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 500),
      settings: settings,
    );
  }
}
