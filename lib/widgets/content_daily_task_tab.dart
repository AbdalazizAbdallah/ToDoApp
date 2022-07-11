import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';

import '../helper/color.dart';
import '../helper/enum_priority.dart';
import 'my_custom_slidable_action.dart';

class ContentDailyTaskTab extends StatelessWidget {
  const ContentDailyTaskTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(48.w),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(48.w),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              style: textTheme.headline3,
                              children: const [
                                TextSpan(text: 'Good morning '),
                                TextSpan(
                                    text: 'John',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ]),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Text(
                          'today'.toUpperCase(),
                          style: textTheme.headline3?.copyWith(
                              fontSize: 54.sp, color: ColorsHelper.myPuprle),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          DateFormat('d MMM , yyyy').format(DateTime.now()),
                          style: textTheme.headline3?.copyWith(
                              fontSize: 64.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Completed',
                          style: textTheme.headline3?.copyWith(
                            color: ColorsHelper.myGreen,
                          ),
                        ),
                        SizedBox(
                          height: 17.h,
                        ),
                        RichText(
                          text: TextSpan(
                              style: textTheme.headline3?.copyWith(
                                color: ColorsHelper.myGreen,
                              ),
                              children: const [
                                TextSpan(
                                  text: '4/',
                                ),
                                TextSpan(
                                    text: '10',
                                    style: TextStyle(color: Colors.red)),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Slidable(
                startActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                    MyCustomSlidableAction(
                        onPressed: (context) {},
                        colorsAction: ColorsHelper.myGreen,
                        iconAction: Icons.task_alt,
                        textAction: 'Done'),
                  ],
                ),
                endActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const ScrollMotion(),
                  children: [
                    MyCustomSlidableAction(
                        onPressed: (context) {},
                        iconAction: Icons.schedule,
                        colorsAction: ColorsHelper.myRedAction,
                        textAction: 'Later'),
                  ],
                ),
                child: MyToDoWidget(
                    dateTimeToDoString:
                        '2022-07-0${index + 1} $index:0${(index * 2)}:16.638478',
                    prorityToDoEnum: index % 2 == 0
                        ? ProrityToDoEnum.high
                        : ProrityToDoEnum.tooHigh,
                    titleToDO: 'Metting with client $index',
                    subtitleToDO: 'Official'),
              );
            },
          ),
        )
      ],
    );
  }
}
