import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final Function()? onTap;
  final String firstText;
  final String boldText;
  final Color? boldTColor;
  final TextStyle? boldTextStyle;
  final TextStyle? firstTextStyle;
  const CustomRichText(
      {super.key,
      required this.onTap,
      this.firstTextStyle,
      required this.firstText,
      required this.boldText,
      this.boldTColor,
      this.boldTextStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: firstTextStyle ?? AppTextStyle.paragraph2(),
            children: [
          TextSpan(
            text: "$firstText  ",
          ),
          TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              text: boldText,
              style: boldTextStyle ??
                  AppTextStyle.tittleSmall3(
                    color: boldTColor ?? Colors.black,
                  )),
        ]));
  }
}
