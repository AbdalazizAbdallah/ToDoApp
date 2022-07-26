import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/helper/app_constants/constant_app_color.dart';

import '../helper/app_constants/constant_app_images.dart';
import '../routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(144.w),
        children: <Widget>[
          FractionallySizedBox(
            widthFactor: 0.4,
            child: SvgPicture.asset(
              ConstantAppImageHelper.logoLogin,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: Colors.grey)),
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: 'Username'),
                  ),
                  const Divider(
                    height: 8,
                    endIndent: 10,
                    indent: 10,
                  ),
                  TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: 'password'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 48.h,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesGenerator.homePage);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text('LOGIN',
                  style: textTheme.headline3?.copyWith(color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 160.h,
          ),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: Divider(
                  thickness: 1,
                  color: ConstantAppColorsHelper.myLightBlack.withOpacity(0.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'OR',
                  style: textTheme.headline4?.copyWith(
                    color:
                        ConstantAppColorsHelper.myLightBlack.withOpacity(0.5),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Divider(
                  thickness: 1,
                  color: ConstantAppColorsHelper.myLightBlack.withOpacity(0.5),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'login using social media',
              style: textTheme.headline4?.copyWith(
                color: ConstantAppColorsHelper.myLightBlack.withOpacity(0.5),
              ),
            ),
          ),
          SizedBox(height: 80.h,),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: ConstantAppColorsHelper.facebookLogoColor,
                child: SvgPicture.asset(ConstantAppImageHelper.facebookPath,height: 25),
              ),CircleAvatar(
                radius: 25,
                backgroundColor: ConstantAppColorsHelper.twitterLogoColor,
                child: SvgPicture.asset(ConstantAppImageHelper.twitterPath,height: 25),
              ), CircleAvatar(
                radius: 25,
                backgroundColor: ConstantAppColorsHelper.googlePlusLogoColor,
                child: SvgPicture.asset(ConstantAppImageHelper.googlePlusPath,height: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
