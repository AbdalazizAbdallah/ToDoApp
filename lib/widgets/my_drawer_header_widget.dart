import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/app_constants/constant_app_color.dart';
import '../helper/app_constants/constant_app_images.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  const MyDrawerHeaderWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return DrawerHeader(
      decoration:
      BoxDecoration(color: ConstantAppColorsHelper.myPuprle),
      child: Column(
        children: [
          CircleAvatar(
            radius: 140.w,
            backgroundColor: Colors.white.withOpacity(0.33),
            child: CircleAvatar(
              radius: 125.w,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: CircleAvatar(
                  radius: 120.w,
                  child: Image.asset(
                      ConstantAppImageHelper.avatarPath),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Abdalziz Abdallah',
            style:
            textTheme.headline3?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}