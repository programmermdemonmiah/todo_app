import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

appbarCommon(String title, BuildContext context,
    {bool hasBackButton = true,
    bool centerTitle = true,
    actions,
    VoidCallback? pressed}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(70.h),
    child: AppBar(
      centerTitle: centerTitle ? true : false,
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.grey),
      title: Text(
        title,
        style: AppTextStyle.tittleBig2(),
      ),
      elevation: 0,
      actions: actions,
      leadingWidth: 55,
      leading: hasBackButton
          ? InkWell(
              onTap: pressed ??
                  () {
                    Get.back();
                  },
              child: Icon(
                Icons.close,
                size: 25.sp,
                color: Colors.black,
              ),
            )
          : Container(),
    ),
  );
}
