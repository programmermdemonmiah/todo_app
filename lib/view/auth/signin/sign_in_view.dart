import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:todo_app/res/getx_localization/string_text.dart';
import 'package:todo_app/utils/ui_const.dart';
import 'package:todo_app/view/widgets/common_appbar.dart';
import 'package:todo_app/view/widgets/custom_textformfild.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarCommon(S.signIn, context),
      body: Padding(
        padding: screenPaddingH(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your Phone Number",
              style: AppTextStyle.tittleBig4(),
            ),
            gapH(3),
            CustomTextformfild(
                controller: TextEditingController(),
                inputType: TextInputType.text,
                hintText: ""),
          ],
        ),
      ),
    );
  }
}
