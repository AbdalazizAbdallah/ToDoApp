

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class MyThemes{
   static ThemeData themeDataPrimaryLight = ThemeData(
            // primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(
              color: ColorsHelper.myPuprle,
            ),
            textTheme: TextTheme(
              headline3: GoogleFonts.roboto(
                fontSize: 42.sp,
                color: Colors.black,
              ),
              headline4: GoogleFonts.roboto(
                fontSize: 36.sp,
                color: Colors.black,
              ),
              subtitle1: GoogleFonts.roboto(
                fontSize: 32.sp,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              subtitle2: GoogleFonts.roboto(
                fontSize: 32.sp,
                color: Colors.black,
              ),
            ),
            scaffoldBackgroundColor: ColorsHelper.myGrayScaffold,
          );
}