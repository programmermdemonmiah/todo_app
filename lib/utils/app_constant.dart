import 'package:todo_app/model/language/language_model.dart';
import 'package:todo_app/res/assets_manager/assets_image.dart';

class AppConstant {
  static const String appFont = 'Arial';
  // static const String Map_API_KEY = '';

  static const String appName = 'TODO APP';

  static const baseUrl = '';
  static const imageBaseUrl = '';

  //shared Prefs===================
  static const String email = "email";
  static const String password = "password";
  static const String loginToken = "LoginToken";
  static const String rememberMe = "RememberMe";
  static const String loginInfo = "LoginInfo";
  static const String userInfo = "UserInfo";
  static const String userId = "UserId";
  static const String themeName = 'ThemeName';
  static const String language = "Language";
  static const String countryCode = "countryCode";
  static const String languageCode = "languageCode";

  static List<LanguageModel> languages = [
    LanguageModel(
        image: AssetsImage.english,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        image: AssetsImage.bangla,
        languageName: 'Bangla',
        countryCode: 'BD',
        languageCode: 'bn'),
  ];
}
