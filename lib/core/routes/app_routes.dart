import 'package:fb_fitbody/core/routes/routes_name.dart';
import 'package:fb_fitbody/features/auth/presentation/views/login_view.dart';
import 'package:fb_fitbody/features/auth/presentation/views/signup_view.dart';
import 'package:fb_fitbody/features/details/presentation/views/details_view.dart';
import 'package:fb_fitbody/features/home/presentation/views/home_view.dart';
import 'package:fb_fitbody/features/layout/presentation/views/layout_view.dart';
import 'package:fb_fitbody/features/onboarding/presentation/on_boarding_view/on_boarding_view.dart';
import 'package:fb_fitbody/features/search/presentation/views/search_result_view.dart';
import 'package:fb_fitbody/features/search/presentation/views/search_view.dart';
import 'package:fb_fitbody/features/splash/presentation/splash_view/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case RoutesName.onBoarding:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      case RoutesName.layoutView:
        return MaterialPageRoute(builder: (context) => const LayoutView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case RoutesName.search:
        return MaterialPageRoute(builder: (context) => const SearchView());

      case RoutesName.searchResult:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SearchResultView(),
        );

      case RoutesName.details:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const DetailsView(),
        );

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
