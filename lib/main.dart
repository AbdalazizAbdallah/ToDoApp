import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/helper/constant_helper.dart';
import 'package:to_do_app/providers/provider_request_http_to_do.dart';
import 'package:to_do_app/routes.dart';
import 'helper/app_constants/constant_app_themes.dart';
import 'model/to_do.dart';

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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<RequestHttpToDoProvider>(create: (context) => RequestHttpToDoProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ConstantAppThemes.themeDataPrimaryLight,
            supportedLocales: const [
              Locale('en'),
            ],
            initialRoute: RoutesGenerator.homePage,
            onGenerateRoute: RoutesGenerator.generateRoutes,
          ),
        );
      },
    );
  }
}
