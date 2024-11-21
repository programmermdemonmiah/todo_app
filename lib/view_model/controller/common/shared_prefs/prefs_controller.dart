import 'package:todo_app/utils/app_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController {
  static late SharedPreferences _prefarence;
  static Future<bool> onInit() async {
    _prefarence = await SharedPreferences.getInstance();
    return true;
  }

//theme set

  static setThemeName(String themeName) =>
      _prefarence.setString(AppConstant.themeName, themeName);
  static get getThemeName => _prefarence.getString(AppConstant.themeName);

  //language Save =============

  static set setLanguage(String language) {
    try {
      _prefarence.setString(AppConstant.language, language).then(
            (value) => debugPrint("successfully add $language"),
          );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static get getLanguage => _prefarence.getString(AppConstant.language);

  static set setLoginToken(String loginToken) {
    try {
      _prefarence.setString(AppConstant.loginToken, loginToken);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //=========
  //user save data ================
  //=========
  static set setLoginInfo(String value) =>
      _prefarence.setString(AppConstant.loginInfo, value);
  static get loginInfo => _prefarence.getString(AppConstant.loginInfo);

  static get loginToken => _prefarence.getString(AppConstant.loginToken);

  static set setRememberMe(bool value) {
    _prefarence.setBool(AppConstant.rememberMe, value).then(
        (value) => debugPrint('Successfully Save you Remember your data'));
  }

  static get getRememberMe => _prefarence.getBool(AppConstant.rememberMe);

  static set setUserId(String userId) =>
      _prefarence.setString(AppConstant.userId, userId);
  static get userId => _prefarence.getString(AppConstant.userId);

  static set setUserInfo(String value) {
    _prefarence.setString(AppConstant.userInfo, value).then(
          (value) => debugPrint('successfully add userdata'),
        );
  }

  static get userInfo => _prefarence.getString(AppConstant.userInfo);

  static logout() {
    if (getRememberMe == true) {
      _prefarence.remove(AppConstant.loginToken);
      _prefarence.remove(AppConstant.userInfo);
      _prefarence.remove(AppConstant.userId);
    } else {
      // _prefarence.remove(AppConstant.loginToken);
      // _prefarence.remove(AppConstant.loginInfo);
      // _prefarence.remove(AppConstant.userId);
      // _prefarence.remove(AppConstant.userDetails);
      removeAll();
    }
  }

  static removeAll() {
    _prefarence.clear();
  }
}
