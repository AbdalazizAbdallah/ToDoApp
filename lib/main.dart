import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/helper/enum_priority.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';

import 'helper/my_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: MyThemes.themeDataPrimaryLight,
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: Center(
        child: Column(
          children: const [
            MyToDoWidget(visibleBadge: true,dateTimeToDoString: '2022-07-05 19:07:16.638478',prorityToDoEnum: ProrityToDoEnum.high,titleToDO: 'Metting with client',subtitleToDO: 'Official'),
            MyToDoWidget(visibleBadge: true,dateTimeToDoString: '2022-02-28 10:37:16.638478',prorityToDoEnum: ProrityToDoEnum.tooHigh,titleToDO: 'Metting with client',subtitleToDO: 'Official'),
            MyToDoWidget(visibleBadge: true,dateTimeToDoString: '2022-07-01 19:07:16.638478',prorityToDoEnum: ProrityToDoEnum.low,titleToDO: 'Metting with client',subtitleToDO: 'Official'),
            MyToDoWidget(visibleBadge: true,dateTimeToDoString: '2022-07-01 19:07:16.638478',prorityToDoEnum: ProrityToDoEnum.medium,titleToDO: 'Metting with client',subtitleToDO: 'Official'),
            MyToDoWidget(visibleBadge: true,dateTimeToDoString: '2022-07-01 19:07:16.638478',prorityToDoEnum: ProrityToDoEnum.tooHigh,titleToDO: 'Metting with client',subtitleToDO: 'Official'),
            MyToDoWidget(visibleBadge: true,dateTimeToDoString: '2022-07-01 19:07:16.638478',prorityToDoEnum: ProrityToDoEnum.tooHigh,titleToDO: 'Metting with client',subtitleToDO: 'Official'),
          
       
          ],
        ),
      ),
    );
  }
}
