import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/app_constants/constant_app_color.dart';

class ItemOfDrawer extends StatelessWidget {
  const ItemOfDrawer({
    Key? key,
    required this.iconWidget,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final Widget iconWidget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2.w, color: ConstantAppColorsHelper.myGray),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: textTheme.headline3,
        ),
        minLeadingWidth: 0,
        leading: SizedBox(
          width: 50.r,
          child: iconWidget,
        ),
      ),
    );
  }
}