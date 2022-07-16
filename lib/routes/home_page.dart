import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/provider_request_http_to_do.dart';
import 'package:to_do_app/routes.dart';
import '../helper/app_constants/constant_app_color.dart';

import '../helper/app_constants/constant_app_images.dart';
import '../pages/page_daily_tab.dart';
import '../pages/page_monthly_tab.dart';
import '../pages/page_weekly_tab.dart';
import '../widgets/item_of_drawer.dart';
import '../widgets/my_drawer_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RequestHttpToDoProvider(),
      child: DefaultTabController(
        length: 3,
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
              child: Builder(builder: (context) {
                return InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SvgPicture.asset(
                    ConstantAppImageHelper.menubarPath,
                  ),
                );
              }),
            ),
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
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, RoutesGenerator.addTaskPage),
                      child: SizedBox(
                        width: 84.w,
                        height: 77.h,
                        child: SvgPicture.asset(
                          ConstantAppImageHelper.addPath,
                        ),
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
                      Tab(
                        text: 'monthly'.toUpperCase(),
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
                PageMonthlyTab(listOfToDo: value.list,),
              ],
            ),
          ),
          drawer: Drawer(
            child: Material(
              color: Colors.white,
              child: ListView(
                children: [
                  const MyDrawerHeaderWidget(),
                  ItemOfDrawer(
                    title: 'New Task',
                    iconWidget: SvgPicture.asset(
                      ConstantAppImageHelper.addPath,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD todo
                      Navigator.pushNamed(context, RoutesGenerator.addTaskPage);
                    },
                  ),
                  ItemOfDrawer(
                    title: 'Important',
                    iconWidget: const Icon(
                      Icons.star_border_rounded,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD Important
                    },
                  ),
                  ItemOfDrawer(
                    title: 'Done',
                    iconWidget: const Icon(
                      Icons.task_alt,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD Important
                    },
                  ),
                  ItemOfDrawer(
                    title: 'Later',
                    iconWidget: const Icon(
                      Icons.schedule,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD later
                    },
                  ),
                  ItemOfDrawer(
                    title: 'Category',
                    iconWidget: const Icon(
                      Icons.category_outlined,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD Category
                    },
                  ),
                  ItemOfDrawer(
                    title: 'Settings',
                    iconWidget: const Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD Settings
                    },
                  ),
                  ItemOfDrawer(
                    title: 'Logout',
                    iconWidget: const Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                    onTap: () {
                      //TODO : ADD Logout
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
