import 'package:blog_application/utils/routes/routes_name.dart';
import 'package:blog_application/view/home_screen.dart';
import 'package:blog_application/view/login_screen.dart';
import 'package:blog_application/view/onboarding_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No route'),
                  ),
                ));
    }
  }
}
