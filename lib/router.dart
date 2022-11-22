/*import 'package:flutter/material.dart';
import 'package:flutter_try/business/DetailPage.dart';
import 'package:flutter_try/models/worker.dart';
import 'package:flutter_try/pages/HomeScreen.dart';
import 'package:flutter_try/pages/SignUpScreen.dart';
import 'package:flutter_try/pages/Wedding_halls.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
     case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
      case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
      case hallsPage.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const hallsPage(),
      );
     case DetailPage.routeName:
      var worker = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => DetailPage(
        worker: worker,
        ),
      );
      default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}*/