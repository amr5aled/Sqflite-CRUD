import 'ui/helper/route_generator.dart';
import 'ui/resources/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            onGenerateRoute: RouteGenerator.generateRoute,

            // initialRoute: AppRoute.home,

            theme: ThemeData(
              backgroundColor: AppPalette.backgroundColor,
              primaryColor: AppPalette.primaryColor,
              accentColor: AppPalette.accentColor,
            ),
          );
        });
  }
}
