import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/model/to_do.dart';
import 'package:to_do_app/widgets/content_daily_task_tab.dart';
import '../widgets/content_daily_all_task_done_tab.dart';

class PageDailyTab extends StatelessWidget {
  const PageDailyTab({
    Key? key,
    required this.listOfToDo,
  }) : super(key: key);

  final List<ToDoEntity>? listOfToDo;

  @override
  Widget build(BuildContext context) {
    if (listOfToDo == null) {
      return Center(
        child: SizedBox(
          width: 100.r,
          height: 100.r,
          child: const CircularProgressIndicator(),
        ),
      );
    } else if (listOfToDo != null && listOfToDo!.isEmpty) {
      return const ContentDailyAllTaskDoneTab();
    } else {
      return ContentDailyTaskTab(
        listOfToEntity: listOfToDo!,
      );
    }
  }
}
