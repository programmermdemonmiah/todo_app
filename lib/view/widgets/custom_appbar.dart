import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

PreferredSizeWidget customAppBar(
    {required String appBarTitle,
    required BuildContext context,
    // required String appBarSubTitle,
    bool Function(ScrollNotification)? notificationPredicate,
    Color? appBarBg,
    Color? leadingColor,
    Widget? leadingIcon,
    final bool? centerTitle,
    List<Widget>? actions,
    void Function()? leadingOnTap,
    Color? textColor}) {
  return AppBar(
    backgroundColor: appBarBg ?? Theme.of(context).primaryColor,
    primary: true,
    centerTitle: centerTitle ?? false,
    foregroundColor: appBarBg ?? AppColors.primaryColor,
    notificationPredicate: notificationPredicate ?? (notification) => true,
    automaticallyImplyLeading: false,
    leading: leadingIcon ??
        InkWell(
            onTap: leadingOnTap ??
                () {
                  Get.back();
                },
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: leadingColor ?? Colors.white,
              size: 25.sp,
            )),
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appBarTitle,
          style: AppTextStyle.tittleBig1(color: textColor ?? Colors.white),
        ),
        // Text(
        //   appBarSubTitle,
        //   style: AppTextStyle.text4(
        //       context: context, color: textColor ?? Colors.white),
        // ),
      ],
    ),
    actions: actions,
  );
}
