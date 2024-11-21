import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todo_app/model/language/language_model.dart';
import 'package:todo_app/utils/app_constant.dart';

class AppLocalization extends Translations {
  final Map<String, Map<String, String>> languages;
  AppLocalization(this.languages);

  @override
  Map<String, Map<String, String>> get keys => languages;

// static const LocalizationsDelegate<AppLocalization> delegate =
//       _LocalizationsDelegate();
}

// class _LocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
//   const _LocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     List<String?> languageString = [];
//     for (var language in AppConstant.languages) {
//       languageString.add(language.languageCode);
//     }
//     return languageString.contains(locale.languageCode);
//   }

//   @override
//   Future<AppLocalization> load(Locale locale) async {
//     AppLocalization localization = AppLocalization();
//     await localization.loadLanguage(locale);
//     return localization;
//   }

//   @override
//   bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
// }

class AppLanguages {
  Future<Map<String, Map<String, String>>> loadLanguage() async {
    final Map<String, Map<String, String>> _languages = {};

    for (LanguageModel languagesData in AppConstant.languages) {
      String jsonString = await rootBundle
          .loadString('assets/language/${languagesData.languageCode}.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _languages[languagesData.languageCode!] =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
    }
    debugPrint('Successfully load languages: $_languages');
    return _languages;
  }
}
