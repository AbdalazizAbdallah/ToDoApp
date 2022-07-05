import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/helper/color.dart';

class MyToDoWidget extends StatefulWidget {
  const MyToDoWidget({Key? key}) : super(key: key);

  @override
  State<MyToDoWidget> createState() => _MyToDoWidgetState();
}

class _MyToDoWidgetState extends State<MyToDoWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 16.0, color: ColorsHelper.myGray),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: ColorsHelper.myGreen,
            width: 216.w,
            height: 48.w,
            child: Center(
                child: Text(
              'Today',
              style: _textTheme.subtitle2?.copyWith(color: Colors.white),
            )),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 50.w),
            minLeadingWidth: 50.w,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_border_rounded,
                    )),
                Container(
                  height: 48.w,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset.zero,
                          blurRadius: 5,
                          spreadRadius: 0,
                        )
                      ]),
                  child: CircleAvatar(
                    radius: 48.w,
                    backgroundColor: ColorsHelper.myHighPriority,
                  ),
                ),
              ],
            ),
            title: Text(
              'Metting with client',
              style: _textTheme.headline3,
            ),
            subtitle: Text(
              'Official',
              style: _textTheme.subtitle1,
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '10:00',
                  style: _textTheme.headline3,
                ),
                RichText(
                  text: TextSpan(
                    style: _textTheme.headline3,
                    children: const [
                      TextSpan(
                        text: 'AM',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
