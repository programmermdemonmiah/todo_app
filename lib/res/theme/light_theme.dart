import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  unselectedWidgetColor: Colors.black26,
  scaffoldBackgroundColor: AppColors.whiteBg,
  cardColor: AppColors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: AppColors.primaryColor,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  iconTheme: IconThemeData(
    color: AppColors.black.withOpacity(0.7),
  ),
  brightness: Brightness.light,
  focusColor: const Color(0xFFC3CAD9),
  hintColor: const Color(0xFF52575C),
  canvasColor: const Color(0xFFFCFCFC),
  primaryColorDark: Colors.black,
  shadowColor: Colors.grey[300],
  textTheme: const TextTheme(bodyMedium: TextStyle(color: Color(0xFF002349))),
  popupMenuTheme: const PopupMenuThemeData(
      color: Colors.white, surfaceTintColor: Colors.white),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: const Color(0xffF9A436),
    onPrimary: const Color(0xffF9A436),
    secondary: const Color(0xFFEFE6FE),
    onSecondary: const Color(0xFFEFE6FE),
    error: Colors.redAccent,
    onSecondaryContainer: const Color(0xffff6a6a),
    onError: Colors.redAccent,
    surface: Colors.white,
    onSurface: const Color(0xFF002349),
    shadow: Colors.grey[300],
  ),
);
