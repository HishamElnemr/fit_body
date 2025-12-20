import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/on_boarding_view/on_boarding_view.dart';
import 'package:fb_fitbody/features/splash_view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case RoutesName.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());

      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(child: Text('No Route defined')),
            );
          },
        );
    }
  }
}
