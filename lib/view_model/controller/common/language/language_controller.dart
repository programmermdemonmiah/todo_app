import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/language/language_model.dart';
import 'package:todo_app/utils/app_constant.dart';
import 'package:todo_app/view_model/controller/common/shared_prefs/prefs_controller.dart';

class LanguageController extends GetxController {
  Locale _locale = Locale(AppConstant.languages[0].languageCode!,
      AppConstant.languages[0].countryCode);
  set setLocale(Locale value) => _locale = value;
  Locale get locale => _locale;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final savedLanguage = PrefsController.getLanguage;

    if (savedLanguage != null) {
      setLocale = Locale(
          savedLanguage[AppConstant.languageCode] ??
              AppConstant.languages[0].languageCode!,
          savedLanguage[AppConstant.countryCode] ??
              AppConstant.languages[0].countryCode);
    }

    update();
    refresh();
  }

  changeLanguae(LanguageModel language) {
    setLocale = Locale(language.languageCode!, language.countryCode);
    update();
    _saveLanguage(locale);
    update();
    refresh();
  }

  _saveLanguage(Locale locale) async {
    PrefsController.setLanguage = jsonEncode({
      AppConstant.languageCode: locale.languageCode,
      AppConstant.countryCode: locale.countryCode
    });
  }
}
