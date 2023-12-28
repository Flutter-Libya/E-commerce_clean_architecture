






















import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'config/theme/my_theme.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPref.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      rebuildFactor: (old, data) => true,
      useInheritedMediaQuery: true,
      builder: (context, widget) {
        return GetMaterialApp(
       
          useInheritedMediaQuery: true,
             title: "E-commerce App",
          debugShowCheckedModeBanner: false,
          builder: (context,widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                child: widget!,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
