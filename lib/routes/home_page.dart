import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helper/enum_priority.dart';
import '../helper/color.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
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
                      'images/alarm.svg',
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
                    'images/add.svg',
                  ),
                ),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(168.h),
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
                      borderSide: BorderSide(color: ColorsHelper.myPuprle),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
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
                                style: textTheme.headline3, children: [
                              TextSpan(text: 'Good morning '),
                              TextSpan(
                                  text: 'John',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
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
                                children: [
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
                itemBuilder: (context,index){
              return
                MyToDoWidget(visibleBadge : index==0 ? true : false,
                    dateTimeToDoString: '2022-07-0${index+1} 19:07:16.638478',
                    prorityToDoEnum: index%2 ==0 ? ProrityToDoEnum.high : ProrityToDoEnum.tooHigh,
                    titleToDO: 'Metting with client',
                    subtitleToDO: 'Official');
            })
          )
        ],
      ),
    );
  }
}
