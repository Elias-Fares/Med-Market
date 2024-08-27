import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pharmachy_app/core/constant.dart';
import 'package:pharmachy_app/core/widgets/style/theme.dart';
import 'package:pharmachy_app/screen/auth/splash_screen.dart';
import '../core/routs.dart';
import '../utlis/bindings/main_binding.dart';
import '../utlis/translation/translation.dart';
import 'controller/ThemeController.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetBuilder<ThemeController>(
            init: ThemeController(),
            builder: (theme) {
              return GetMaterialApp(
                  locale: AppLanguageKeys.appLang.value == AR
                      ? const Locale('ar', '')
                      : const Locale('en', ''),
                  // locale: const Locale("ar"),
                  debugShowCheckedModeBanner: false,
                  initialBinding: MainBinding(),
                  translations: Translation(),
                  initialRoute: SplashScreen.routeName,
                  // theme: Get.find<ThemeController>().currentTheme,
                  theme: AppTheme.ligthTheme,
                  darkTheme: Get.find<ThemeController>().darkTheme,
                  //themeMode: ThemeMode.system,
                  // change it when you enable theming in app //
                  themeMode: ThemeMode.light,
                  getPages: Routs.getPages);
            });
      },
    );
  }
}
