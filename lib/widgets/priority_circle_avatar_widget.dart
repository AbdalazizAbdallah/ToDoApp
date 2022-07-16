import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriorityCircleAvatarWidget extends StatelessWidget {
  const PriorityCircleAvatarWidget({
    Key? key,
    required this.myColor,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final Color myColor;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 72.w),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 35.w,
          backgroundColor: isSelected ? myColor.withOpacity(0.75) : myColor,
          child: CircleAvatar(
            radius: 24.w,
            backgroundColor: myColor,
          ),
        ),
      ),
    );
  }
}
