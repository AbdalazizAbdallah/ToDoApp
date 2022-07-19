import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../helper/app_constants/constant_app_color.dart';
import '../helper/app_date_helper.dart';
import '../helper/constant_helper.dart';
import '../model/to_do.dart';
import '../widgets/to_do_widget.dart';

class PageMonthlyTab extends StatefulWidget {
  const PageMonthlyTab({
    Key? key,
    required this.listOfToDo,
  }) : super(key: key);

  final List<ToDoEntity>? listOfToDo;

  @override
  State<PageMonthlyTab> createState() => _PageMonthlyTabState();
}

class _PageMonthlyTabState extends State<PageMonthlyTab> {
  Map<String, List<ToDoEntity>> groupingByDateToDoEntity = {};
  List<String> listOfKey = [];
  List<List<ToDoEntity>> itemList = [];
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();

    groupingByDateToDoEntity =
        ConstantHelper.groupingByDateToDoEntity(widget.listOfToDo ?? []);
    listOfKey = groupingByDateToDoEntity.keys.toList();
    itemList = groupingByDateToDoEntity.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;
    return Flex(
      direction: Axis.vertical,
      children: [
        SizedBox(
          height: 668.h,
          child: TableCalendar(
            shouldFillViewport: true,
            rowHeight: 50,
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
              holidayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
            ),
            calendarStyle: const CalendarStyle(
                canMarkersOverflow: true,
                todayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white)),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ),
        Expanded(
          child: ListView(
            children:
                List<Widget>.generate(groupingByDateToDoEntity.length, (index) {
              return Column(
                children: [
                  Material(
                    color: ConstantAppColorsHelper.myGrayScaffold,
                    child: SizedBox(
                      height: 70.h,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          AppDateHelper.getDateCustom(listOfKey[index]),
                          style: textTheme.headline4?.copyWith(
                              color: ConstantAppColorsHelper.myPuprle),
                        ),
                      ),
                    ),
                  ),
                  ...itemList[index].map((ToDoEntity element) => 
                  MyToDoWidget(toDo: element)
                  )
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
