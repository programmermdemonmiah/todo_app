import 'package:flutter/material.dart';

class LanguageModel {
  String? _image;
  String? _languageName;
  String? _languageCode;
  String? _countryCode;

  LanguageModel(
      {required String image,
      required String languageName,
      required String languageCode,
      required String countryCode}) {
    _image = image;
    _languageName = languageName;
    _languageCode = languageCode;
    _countryCode = countryCode;
  }

  String? get countryCode => _countryCode;
  String? get languageCode => _languageCode;
  String? get languageName => _languageName;
  String? get image => _image;
}
