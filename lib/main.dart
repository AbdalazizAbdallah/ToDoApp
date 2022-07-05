import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/widgets/to_do_widget.dart';

import 'helper/color.dart';

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
          theme: ThemeData(
            // primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              color: ColorsHelper.myPuprle,
            ),
            textTheme: TextTheme(
              headline3: GoogleFonts.roboto(
                fontSize: 42.sp,
                color: ColorsHelper.myBlack,
              ),
              headline4: GoogleFonts.roboto(
                fontSize: 36.sp,
                color: ColorsHelper.myBlack,
              ),
              subtitle1: GoogleFonts.roboto(
                fontSize: 32.sp,
                color: ColorsHelper.myBlack,
                fontWeight: FontWeight.w300,
              ),
              subtitle2: GoogleFonts.roboto(
                fontSize: 32.sp,
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
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
      body: const Center(
        child: MyToDoWidget(),
      ),
    );
  }
}
