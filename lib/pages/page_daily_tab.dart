import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/content_daily_task_tab.dart';
import '../widgets/content_daily_all_task_done_tab.dart';

class PageDailyTab extends StatelessWidget {

  const PageDailyTab({
    Key? key,
    this.allTaskDone = false,
  }) : super(key: key);

  final bool allTaskDone;

  @override
  Widget build(BuildContext context) {
    return allTaskDone ? const ContentDailyAllTaskDoneTab()  : const ContentDailyTaskTab();
  }
}
