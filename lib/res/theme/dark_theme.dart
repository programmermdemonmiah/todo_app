import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.primaryColor,
  secondaryHeaderColor: const Color(0xFFefe6fc),
  brightness: Brightness.dark,
  primaryColorDark: Colors.white,
  unselectedWidgetColor: Colors.white24,
  cardColor: const Color(0xFF29292D),
  hintColor: const Color(0xFFE7F6F8),
  focusColor: const Color(0xFFC3CAD9),
  shadowColor: Colors.black.withOpacity(0.4),
  popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xFF29292D), surfaceTintColor: Color(0xFF29292D)),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white10),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0xffF9A436),
    onPrimary: const Color(0xffF9A436),
    secondary: const Color(0xFFefe6fc),
    onSecondary: const Color(0xFFefe6fc),
    error: Colors.redAccent,
    onError: Colors.redAccent,
    surface: Colors.white10,
    onSurface: Colors.white70,
    shadow: Colors.black.withOpacity(0.4),
  ),
);
