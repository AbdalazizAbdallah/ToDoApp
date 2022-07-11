import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../helper/color.dart';

class MyCustomSlidableAction extends StatelessWidget {
  const MyCustomSlidableAction({
    Key? key,
    required this.onPressed,
    required this.iconAction,
    required this.textAction,
    required this.colorsAction,
  }) : super(key: key);

  final Function(BuildContext) onPressed;
  final IconData iconAction;
  final String textAction;
  final Color colorsAction;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return CustomSlidableAction(
      padding: const EdgeInsets.symmetric(vertical: 5),
      onPressed: onPressed,
      child: Container(
        height: double.infinity,
        color: colorsAction ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 48.w,
              height: 60.h,
              child: Icon(
                iconAction,
                color: Colors.white,
              ),
            ),
            Text(
              textAction,
              style: textTheme.headline3
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
