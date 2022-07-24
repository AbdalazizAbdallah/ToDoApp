import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';
import 'package:to_do_app/helper/app_date_helper.dart';
import 'package:to_do_app/helper/customs_shape/curve_date.dart';

import '../providers/provider_request_http_to_do.dart';
import '../routes.dart';
import '../widgets/app_bar_widget.dart';

class TaskDetails extends StatefulWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(350.h),
        child: const AppBarWidget(
          title: 'Task Details',
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: ConstantAppColorsHelper.myPuprle,
              height: 168.h,
              width: double.infinity,
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(48.w),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomPaint(
                      painter: CurveDate(color: Colors.blue),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 5.h, left: 60.w, top: 5.h, right: 30.w),
                        child: Text(
                          'Nice to have',
                          style: textTheme.subtitle2
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Consumer<RequestHttpToDoProvider>(
                  builder: (context, value, child) => Padding(
                    padding: EdgeInsets.all(45.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value.toDoSelected!.titleToDO,
                          style: textTheme.headline3
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          AppDateHelper.getDateCustomDatMonthYear(
                              value.toDoSelected!.dateTimeToDoString),
                          style: textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: ConstantAppColorsHelper.myLightBlack
                                .withOpacity(0.5),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          'Have to meet him because i want to show him my latest app design in person.\nAlso need to ask for advice on these: \n -style \n- interaction \n- copy                    ',
                          softWrap: true,
                          maxLines: null,
                          style: textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 36.sp,
                            height: 1.5,
                            color: ConstantAppColorsHelper.myLightBlack
                                .withOpacity(0.75),
                          ),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        RichText(
                            text: TextSpan(
                                text: 'Category:',
                                style: textTheme.subtitle2
                                    ?.copyWith(fontWeight: FontWeight.bold),
                                children: [
                              TextSpan(
                                  text: ' Friend',
                                  style: textTheme.subtitle2
                                      ?.copyWith(fontWeight: FontWeight.normal))
                            ]))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                    Navigator.pushNamed(context, RoutesGenerator.editTaskPages);

                      },
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.schedule,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.task_alt,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
