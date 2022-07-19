import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';
import 'package:to_do_app/model/to_do.dart';
import 'package:to_do_app/routes.dart';

import '../helper/app_date_helper.dart';
import '../helper/constant_helper.dart';
import '../helper/customs_shape/curve_date.dart';
import '../providers/provider_request_http_to_do.dart';

class MyToDoWidget extends StatelessWidget {
    MyToDoWidget({
    Key? key,
    this.visibleBadge = false,
    required this.toDo,
    Color? colorBadge,
  }) : super(key: key) {
    this.colorBadge = colorBadge?? ConstantAppColorsHelper.myGreen;
  }

  final ToDoEntity toDo;
  final bool visibleBadge;
  late final Color colorBadge;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: visibleBadge,
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                CustomPaint(
                  painter: CurveDate(color: colorBadge),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 5.h, left: 60.w, top: 5.h, right: 30.w),
                    child: Text(
                      AppDateHelper.getDateCustom(toDo.dateTimeToDoString),
                      style: textTheme.subtitle2?.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              context.read<RequestHttpToDoProvider>().setIdSelected = toDo.id;
              Navigator.pushNamed(context, RoutesGenerator.taskDetailsPages);
            },
            contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
            minLeadingWidth: 50.w,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    // TODO: star todo
                  },
                  icon: toDo.isFavorite
                      ? const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      : const Icon(
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
                        ConstantHelper.getColorPriority(toDo.prorityToDoEnum),
                  ),
                ),
              ],
            ),
            title: Text(
              toDo.titleToDO,
              style: textTheme.headline3,
            ),
            subtitle: Text(
              toDo.subtitleToDO,
              style: textTheme.subtitle1,
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  AppDateHelper.getHourOfDate(toDo.dateTimeToDoString),
                  style: textTheme.headline3
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                RichText(
                  text: TextSpan(
                    style: textTheme.headline3
                        ?.copyWith(color: Colors.black.withOpacity(0.75)),
                    children: [
                      TextSpan(
                        text: AppDateHelper.getPMorAMOfDate(
                            toDo.dateTimeToDoString),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Divider(height: 2.w, color: ConstantAppColorsHelper.myGray),
        ],
      ),
    );
  }
}
