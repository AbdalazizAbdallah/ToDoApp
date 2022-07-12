
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../helper/app_constants/constant_app_color.dart';
import '../helper/app_constants/constant_app_images.dart';

class ContentDailyAllTaskDoneTab extends StatelessWidget {
  const ContentDailyAllTaskDoneTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 455.w,
            width: 579.h,
            child: SvgPicture.asset(ConstantAppImageHelper.noTaskPath),
          ),
          SizedBox(
            height: 60.h,
          ),
          Text(
            'All Done For Now',
            style: textTheme.headline3
                ?.copyWith(fontSize: 48.sp, color: ConstantAppColorsHelper.myPuprle),
          ),
          SizedBox(
            height: 40.h,
          ),
          Text(
            'Next Task',
            style: textTheme.subtitle1?.copyWith(
                fontWeight: FontWeight.w300,
                color: ConstantAppColorsHelper.myLightBlack.withOpacity(0.5)),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            'Tomorrow 3:55 PM',
            style: textTheme.subtitle1
                ?.copyWith( fontWeight: FontWeight.w500,color: ConstantAppColorsHelper.myLightBlack.withOpacity(0.5)),
          ),
          SizedBox(
            height: 22.h,
          ),
          Text(
            'Time for a Break',
            style:
                textTheme.headline3?.copyWith( fontWeight: FontWeight.w600,color: ConstantAppColorsHelper.myLightBlack),
          ),
        ],
      ),
    );
  }
}
