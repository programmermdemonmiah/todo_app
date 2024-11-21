import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommonRichText extends StatelessWidget {
  final String firstText;
  final String firstTextBold;
  final String secondText;
  final String secondTextBold;
  final void Function() firstOnTap;
  final void Function() secondOnTap;
  const CommonRichText(
      {super.key,
      required this.firstOnTap,
      required this.secondOnTap,
      required this.firstText,
      required this.firstTextBold,
      required this.secondText,
      required this.secondTextBold});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(style: AppTextStyle.text1(), children: [
      TextSpan(text: firstText),
      TextSpan(
          recognizer: TapGestureRecognizer()..onTap = firstOnTap,
          text: firstTextBold,
          style: AppTextStyle.tittleSmall1()
              .copyWith(color: Theme.of(context).primaryColor)),
      TextSpan(text: secondText),
      TextSpan(
          recognizer: TapGestureRecognizer()..onTap = secondOnTap,
          text: secondTextBold,
          style: AppTextStyle.tittleSmall1()
              .copyWith(color: Theme.of(context).primaryColor)),
    ]));
  }
}
