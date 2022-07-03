import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:free_pad/constant/provider.dart';
import 'package:free_pad/constant/screen_routes.dart';
import 'package:free_pad/locator.dart';
import 'package:free_pad/ui/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MultiProvider(providers: AppProviders.providers, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, theme, _) {
      return ScreenUtilInit(
        designSize: Size(375, 424),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
          theme: theme.darkTheme,
          debugShowCheckedModeBanner: false,
          title: 'FreePad',
          routes: RouteNames.routes,
          initialRoute: RouteNames.authScreen,
          onGenerateRoute: RouteNames.generateRoute,
          navigatorKey: Get.key,
        );
        },
      );
    });
  }
}
