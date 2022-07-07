import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 58.h),
          child: SvgPicture.asset(
            'images/logo.svg',
            height: 58.h,
            width: 299.w,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 58.h),
          child: SizedBox(
            child: SvgPicture.asset(
              'images/menubar.svg',
            ),
          ),
        ),
        actions: [
          SizedBox(
            width: 84.w,
            height: 77.h,
            child: SvgPicture.asset(
              'images/alarm.svg',
            ),
          ),
          SizedBox(
            width: 84.w,
            height: 77.h,
            child: SvgPicture.asset(
              'images/alarm.svg',
            ),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(168.h),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search',
                    suffixIcon: Icon(Icons.search),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
