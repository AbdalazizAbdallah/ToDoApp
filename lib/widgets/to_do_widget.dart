import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';
import 'package:to_do_app/helper/customs_shape/curve_date.dart';

import '../helper/app_date_helper.dart';
import '../helper/constant_helper.dart';
import '../helper/enum_priority.dart';

class MyToDoWidget extends StatelessWidget {
  const MyToDoWidget({
    Key? key,
    this.visibleBadge = false,
    required this.dateTimeToDoString,
    required this.prorityToDoEnum,
    required this.titleToDO,
    required this.subtitleToDO,
  }) : super(key: key);

  final bool visibleBadge;
  final String dateTimeToDoString;
  final ProrityToDoEnum prorityToDoEnum;
  final String titleToDO;
  final String subtitleToDO;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 2.w, color: ConstantAppColorsHelper.myGray),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: visibleBadge,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                CustomPaint(
                  painter: CurveDate(),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 5.h, left: 60.w, top: 5.h, right: 30.w),
                    child: Text(
                      AppDateHelper.getDateCustom(dateTimeToDoString),
                      style: textTheme.subtitle2?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
            minLeadingWidth: 50.w,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    // TODO: star todo
                  },
                  icon: const Icon(
                    Icons.star_border_rounded,
                  ),
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset.zero,
                        blurRadius: 2,
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 24.w,
                    backgroundColor:
                        ConstantHelper.getColorPriority(prorityToDoEnum),
                  ),
                ),
              ],
            ),
            title: Text(
              titleToDO,
              style: textTheme.headline3,
            ),
            subtitle: Text(
              subtitleToDO,
              style: textTheme.subtitle1,
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppDateHelper.getHourOfDate(dateTimeToDoString),
                  style: textTheme.headline3
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                RichText(
                  text: TextSpan(
                    style: textTheme.headline3
                        ?.copyWith(color: Colors.black.withOpacity(0.75)),
                    children: [
                      TextSpan(
                        text:
                            AppDateHelper.getPMorAMOfDate(dateTimeToDoString),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
