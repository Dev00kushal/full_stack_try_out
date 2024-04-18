import 'package:blog_application/utils/routes/routes_name.dart';
import 'package:blog_application/view/create_jokes_screen.dart';
import 'package:blog_application/view/jokes_screen.dart';
import 'package:blog_application/view/view_jokes_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.jokesScreen:
        return MaterialPageRoute(builder: (_) => const JokesScreen());
      case RoutesName.jokesCreationScreen:
        return MaterialPageRoute(builder: (_) => const JokeCreatorScreen());
      case RoutesName.jokesViewScreen:
        return MaterialPageRoute(builder: (_) => const ViewJokesScreen());
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
