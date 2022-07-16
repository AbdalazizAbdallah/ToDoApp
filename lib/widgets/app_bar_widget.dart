import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../helper/app_constants/constant_app_color.dart';
import '../helper/app_constants/constant_app_images.dart';
import '../routes.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
    required this.visibleAddIcon,
  }) : super(key: key);

  final String title ;
  final bool visibleAddIcon ;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Text(title),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Badge(
                position : BadgePosition.topEnd(top: 0, end: 5),
                toAnimate: true,
                badgeContent:
                const Icon(Icons.error, size: 2, color: Colors.red),
                child: SizedBox(
                  width: 84.w,
                  height: 77.h,
                  child: SvgPicture.asset(
                    ConstantAppImageHelper.alarmPath,
                  ),
                ),
              ),
              SizedBox(
                width: 48.w,
              ),
              Visibility(
                visible: visibleAddIcon,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, RoutesGenerator.addTaskPage),
                  child: SizedBox(
                    width: 84.w,
                    height: 77.h,
                    child: SvgPicture.asset(
                      ConstantAppImageHelper.addPath,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(178.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 48.w, left: 48.w),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Search',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: ConstantAppColorsHelper.myPuprle),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}