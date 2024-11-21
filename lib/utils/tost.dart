import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

showToast(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 600),
      boxShadows: [
        const BoxShadow(
            color: AppColors.whiteBg, blurRadius: 32, spreadRadius: 12)
      ],
      margin: EdgeInsets.only(top: 8.sp, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      borderRadius: 5,
      colorText: Colors.lightBlue[500]);
}

showSuccessTost(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: Colors.white.withOpacity(0.2),
      animationDuration: const Duration(milliseconds: 600),
      boxShadows: [
        const BoxShadow(
            color: AppColors.whiteBg, blurRadius: 32, spreadRadius: 12)
      ],
      margin: EdgeInsets.only(top: 8.sp, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      borderRadius: 5,
      colorText: Colors.green[500]);
}

showErrorTost(String title, String message) {
  Get.snackbar(title, message,
      backgroundColor: Colors.white.withOpacity(0.2),
      animationDuration: const Duration(milliseconds: 600),
      boxShadows: [
        const BoxShadow(
            color: AppColors.whiteBg, blurRadius: 32, spreadRadius: 12)
      ],
      margin: EdgeInsets.only(top: 8.sp, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      borderRadius: 5,
      colorText: Colors.red[500]);
}

showTost(String message) {
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black12,
      textColor: Colors.black54,
      fontSize: 15.sp);
}

showNetworkTost(String message) {
  return Get.rawSnackbar(
    message: message,
    isDismissible: true,
    duration: Duration.zero,
    backgroundColor: AppColors.lightRed.withOpacity(0.5),
    snackPosition: SnackPosition.BOTTOM,
  );
}
