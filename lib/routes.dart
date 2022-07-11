import 'package:flutter/material.dart';
import 'package:to_do_app/routes/home_page.dart';

class RoutesGenerator {
  static const String homePage = '/';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
      default:
        throw const FormatException('Page not found');
    }
  }



  
}
