import 'package:flutter/material.dart';
import 'package:to_do_app/routes/add_task.dart';
import 'package:to_do_app/routes/done_tasks.dart';
import 'package:to_do_app/routes/home_page.dart';
import 'package:to_do_app/routes/later_task.dart';
import 'package:to_do_app/routes/task_details.dart';

class RoutesGenerator {
  static const String homePage = '/';
  static const String addTaskPage = '/addTask';
  static const String taskDetailsPages = '/TaskDetails';
  static const String doneTaskPages = '/DoneTask';
  static const String laterTaskPages = '/LaterTask';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
      case addTaskPage:
        return MaterialPageRoute(builder: ((context) => const AddTask()));
      case taskDetailsPages:
        return MaterialPageRoute(builder: ((context) => const TaskDetails()));
      case doneTaskPages:
        return MaterialPageRoute(builder: ((context) => const DoneTask()));
      case laterTaskPages:
        return MaterialPageRoute(builder: ((context) => const LaterTask()));
      default:
        throw const FormatException('Page not found');
    }
  }



  
}
