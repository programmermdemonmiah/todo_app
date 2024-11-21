import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/all_binding/get_di.dart';
import 'package:todo_app/res/app_routes/app_routes.dart';
import 'package:todo_app/res/app_routes/app_routes_name.dart';
import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:todo_app/res/getx_localization/app_localization.dart';
import 'package:todo_app/res/theme/dark_theme.dart';
import 'package:todo_app/res/theme/light_theme.dart';
import 'package:todo_app/utils/app_constant.dart';
import 'package:todo_app/view_model/controller/common/language/language_controller.dart';
import 'package:todo_app/view_model/controller/common/shared_prefs/prefs_controller.dart';
import 'package:todo_app/view_model/controller/common/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColor,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //Languages load
  AppLanguages appLanguages = AppLanguages();
  final languages = await appLanguages.loadLanguage();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (_, __) {
          return GetBuilder<ThemeController>(builder: (themeController) {
            return GetBuilder<LanguageController>(builder: (languageControler) {
              return GetMaterialApp(
                locale: languageControler.locale,
                translations: AppLocalization(widget.languages),
                fallbackLocale: Locale(AppConstant.languages[0].languageCode!,
                    AppConstant.languages[0].countryCode),
                theme: themeController.darkTheme ? darkTheme : lightTheme,
                getPages: AppRoutes.appRoutes(),
                builder: (context, child) {
                  return Stack(
                    children: [
                      child!,
                    ],
                  );
                },
                initialRoute: AppRoutesName.splashView,
                debugShowCheckedModeBanner: false,
              );
            });
          });
        });
  }
}
