import 'package:flutter/material.dart';
import 'package:to_do_app/routes/add_task.dart';
import 'package:to_do_app/routes/done_tasks.dart';
import 'package:to_do_app/routes/edit_task.dart';
import 'package:to_do_app/routes/home_page.dart';
import 'package:to_do_app/routes/later_task.dart';
import 'package:to_do_app/routes/login.dart';
import 'package:to_do_app/routes/task_details.dart';

class RoutesGenerator {
  static const String homePage = '/homePage';
  static const String addTaskPage = '/addTask';
  static const String taskDetailsPage = '/TaskDetails';
  static const String doneTaskPage = '/DoneTask';
  static const String laterTaskPage = '/LaterTask';
  static const String editTaskPage = '/editTask';
  static const String loginPage = '/';

  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case homePage:
        return MaterialPageRoute(builder: ((context) => const HomePage()));
      case addTaskPage:
        return MaterialPageRoute(builder: ((context) => const AddTask()));
      case taskDetailsPage:
        return MaterialPageRoute(builder: ((context) => const TaskDetails()));
      case doneTaskPage:
        return MaterialPageRoute(builder: ((context) => const DoneTask()));
      case laterTaskPage:
        return MaterialPageRoute(builder: ((context) => const LaterTask()));
      case editTaskPage:
        return MaterialPageRoute(builder: ((context) => const EditTask()));
      case loginPage:
        return MaterialPageRoute(builder: ((context) => const LoginPage()));
      default:
        throw const FormatException('Page not found');
    }
  }
}
