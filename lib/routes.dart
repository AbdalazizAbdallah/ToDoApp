import 'package:flutter/material.dart';
import 'package:to_do_app/pages/add_task.dart';
import 'package:to_do_app/routes/home_page.dart';

class RoutesGenerator {
  static const String homePage = '/';
  static const String addTaskPage = '/addTask';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
      case addTaskPage:
        return MaterialPageRoute(builder: ((context) => const AddTask()));
      default:
        throw const FormatException('Page not found');
    }
  }



  
}
