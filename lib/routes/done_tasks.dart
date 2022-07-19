import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';

import '../helper/constant_helper.dart';
import '../model/to_do.dart';
import '../providers/provider_request_http_to_do.dart';
import '../widgets/app_bar_widget.dart';

class DoneTask extends StatefulWidget {
  const DoneTask({
    Key? key,
  }) : super(key: key);

  @override
  State<DoneTask> createState() => _DoneTaskState();
}

class _DoneTaskState extends State<DoneTask> {
  Map<String, List<ToDoEntity>> groupingByDateToDoEntity = {};
  List<String> listOfKey = [];
  List<List<ToDoEntity>> itemList = [];
  late TextTheme textTheme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    List<ToDoEntity>? list= context.read<RequestHttpToDoProvider>().getDoneTask();print('--');
    groupingByDateToDoEntity =
        ConstantHelper.groupingByDateToDoEntity(list ?? []);
    listOfKey = groupingByDateToDoEntity.keys.toList();
    itemList = groupingByDateToDoEntity.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(350.h),
        child: const AppBarWidget(
          title: 'Done Task',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(48.h),
        child: ListView.separated(
          itemCount: listOfKey.length,
          itemBuilder: (context, outerIndex) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children:[ ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemList[outerIndex].length,
                itemBuilder: (context, innerIndex) {
                  return MyToDoWidget(
                    toDo: ((itemList[outerIndex])[innerIndex]),
                    visibleBadge: innerIndex == 0 ? true : false,
                  );
                },
              ),
              ]
              );
            
          }, separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 48.h,);
          },
        ),
      ),
    );
  }
}
