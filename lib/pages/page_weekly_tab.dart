import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';
import 'package:to_do_app/helper/constant_helper.dart';
import 'package:to_do_app/helper/customs_shape/cuve_date.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';

import '../helper/app_date_helper.dart';
import '../helper/customs_shape/curve_date_weekly.dart';
import '../model/to_do.dart';

class PageWeeklyTab extends StatefulWidget {
  const PageWeeklyTab({Key? key,
  required this.listOfToDo,
  }) : super(key: key);
  final List<ToDoEntity>? listOfToDo;

  @override
  State<PageWeeklyTab> createState() => _PageWeeklyTabState();
}

class _PageWeeklyTabState extends State<PageWeeklyTab> {
  Map<String, List<ToDoEntity>> groupingByDateToDoEntity = {};
  List<String> listOfKey = [];
  List<List<ToDoEntity>> itemList = [];
  List<String> datOfWeeks = [];
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();

    groupingByDateToDoEntity = ConstantHelper.groupingByDateToDoEntity(widget.listOfToDo??[]);
    listOfKey = groupingByDateToDoEntity.keys.toList();
    itemList = groupingByDateToDoEntity.values.toList();
    datOfWeeks =
        AppDateHelper.getDaysOfWeek(pickedDate: '2022-07-13 22:38:27.654812');
  }

  @override
  Widget build(BuildContext context) {
    textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 96.h,
            child: Center(
              child: Text(
                AppDateHelper.getDateCustomMonthYear(listOfKey[0]),
                style: textTheme.headline3?.copyWith(
                    color: ConstantAppColorsHelper.myLightBlack,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Material(
            color: ConstantAppColorsHelper.myPuprle,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: List<Widget>.generate(datOfWeeks.length, (index) {
                  Widget child;
                  if (!AppDateHelper.isSameDay(datOfWeeks[index])) {
                    child = getDayOfWeekWidget(false, datOfWeeks[index]);
                  } else {
                    debugPrint(
                        '${AppDateHelper.isSameDay(datOfWeeks[index])} ---${DateTime.now()}--- ${datOfWeeks[index]}');
                    child = getDayOfWeekWidget(true, datOfWeeks[index]);
                  }
                  return Expanded(child: child);
                }),
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: ListView(
              children: List<Widget>.generate(groupingByDateToDoEntity.length,
                  (index) {
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
                    for (ToDoEntity item in itemList[index])
                      MyToDoWidget(
                        toDo: item,
                      )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget getDayOfWeekWidget(bool isToday, String date) {
    if (isToday) {
      return Transform.scale(
        scale: 1.2,
        child: CustomPaint(
          painter: CurveDateWeekly(),
          child: ContentDayOfWeekWidget(
              colorText: ConstantAppColorsHelper.myLightBlack, date: date),
        ),
      );
    } else {
      return ContentDayOfWeekWidget(
        colorText: Colors.white,
        date: date,
      );
    }
    ;
  }
}

class ContentDayOfWeekWidget extends StatelessWidget {
  const ContentDayOfWeekWidget({
    Key? key,
    required this.colorText,
    required this.date,
  }) : super(key: key);

  final Color colorText;
  final String date;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: AppDateHelper.getDateMonthMMM(date),
                  style: textTheme.headline4
                      ?.copyWith(color: colorText.withOpacity(0.75))),
              const TextSpan(text: '\n'),
              TextSpan(
                  text: AppDateHelper.getDateDay(date),
                  style: textTheme.headline4
                      ?.copyWith(fontSize: 42.sp, color: colorText)),
            ],
          ),
        ),
      ),
    );
  }
}
