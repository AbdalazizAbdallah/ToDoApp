import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/provider.dart';
import '../helper/app_constants/constant_app_color.dart';

import '../helper/app_constants/constant_app_images.dart';
import '../pages/page_daily_tab.dart';
import '../pages/page_weekly_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider(
      create: (context) => RequestHttpToDoProvider(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(vertical: 58.h),
              child: SvgPicture.asset(
                ConstantAppImageHelper.logoPath,
                height: 58.h,
                width: 299.w,
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 58.h),
              child: SizedBox(
                child: SvgPicture.asset(
                  ConstantAppImageHelper.menubarPath,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Badge(
                      position: BadgePosition.topEnd(),
                      toAnimate: true,
                      badgeContent:
                          const Icon(Icons.error, size: 5, color: Colors.red),
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
                    SizedBox(
                      width: 84.w,
                      height: 77.h,
                      child: SvgPicture.asset(
                        ConstantAppImageHelper.addPath,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(300.h),
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
                  TabBar(
                    tabs: [
                      Tab(
                        text: 'Daily'.toUpperCase(),
                      ),
                      Tab(
                        text: 'Weekly'.toUpperCase(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Consumer<RequestHttpToDoProvider>(
            builder: (context, value, child) => TabBarView(
              children: [
                PageDailyTab(listOfToDo: value.list),
                PageWeeklyTab(listOfToDo: value.list),
              ],
            ),
          ),
          floatingActionButton:  Consumer<RequestHttpToDoProvider>(
              builder: (context, value, child) => FloatingActionButton(
              onPressed: () {
                value.listOfEntity();
                debugPrint('--------------------');
              },
                child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
