import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/res/app_routes/app_routes_name.dart';
import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:todo_app/utils/app_constant.dart';
import 'package:todo_app/view_model/controller/common/shared_prefs/prefs_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    Future.delayed(
      const Duration(seconds: 1),
      () => _checkLogin(),
    );
  }

  void _checkLogin() {
    final token = PrefsController.loginToken;
    if (token != null) {
      _navigatePage(AppRoutesName.homeView);
    } else {
      _navigatePage(AppRoutesName.signInView);
    }
  }

  void _navigatePage(String newRouteName) {
    Get.offAllNamed(newRouteName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          AppConstant.appName,
          style: AppTextStyle.tittleBig1()
              .copyWith(fontSize: 22.sp, color: AppColors.primaryColor),
        ),
      )),
    );
  }
}
