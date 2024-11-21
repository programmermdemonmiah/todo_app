import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:todo_app/utils/ui_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextformfild extends StatelessWidget {
  final BuildContext? context;
  final TextEditingController controller;
  final Key? filedKey;
  final String? hintText;
  final bool isSecurePass;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final bool isFilled;
  final ValueChanged? onChanged;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final TextInputType inputType;
  final bool isSuffix;
  final String? suffixText;
  final bool isPrefix = false;
  final String? prefixText;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final double? radiusSet;
  final bool border;
  final Function(String)? onFieldSubmitted;
  final Function()? suffixTap;
  final EdgeInsets? padding;
  final bool customPadding;
  final int? maxLength;

  const CustomTextformfild(
      {super.key,
      this.context,
      required this.controller,
      this.onFieldSubmitted,
      required this.inputType,
      this.filedKey,
      required this.hintText,
      this.isSecurePass = false,
      this.fillColor,
      this.focusNode,
      this.isFilled = false,
      this.maxLines,
      this.minLines,
      this.onChanged,
      this.onSaved,
      this.prefixIcon,
      this.prefixText,
      this.radiusSet,
      this.suffixIcon,
      this.validator,
      this.suffixText,
      this.suffixTap,
      this.isSuffixIcon = false,
      this.isPrefixIcon = false,
      this.border = true,
      this.isSuffix = false,
      this.padding,
      this.customPadding = false,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: isSecurePass,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      maxLength: maxLength,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Theme.of(context).hintColor,
      enabled: true,
      style: AppTextStyle.text2(
          color: Theme.of(context).textTheme.displayMedium!.color),
      buildCounter: (context,
              {required currentLength,
              required isFocused,
              required maxLength}) =>
          null,
      decoration: InputDecoration(
          contentPadding: customPadding
              ? padding
              : isSuffixIcon && isPrefixIcon
                  ? null
                  : edgeInsetsOnly(4, 4, 1, 1),
          enabled: true,
          filled: isFilled,
          fillColor: fillColor ?? Colors.white,
          hintStyle: AppTextStyle.text2(color: Theme.of(context).focusColor),
          hintText: hintText,

          // suffixText: isSuffix ? suffixText! : null,
          suffixStyle: AppTextStyle.tittleSmall4(),
          focusColor: Colors.black26,
          hoverColor: Colors.black12,
          // prefixText: isPrefix ? prefixText! : null ,
          // prefix: isPrefix ? Padding(
          //   padding: const EdgeInsets.only(right: 3.0),
          //   child: Container(
          //     padding: EdgeInsets.all(3),
          //     color: Colors.black12,
          //     child: Text(prefixText!,style: TextStyle(
          //         color: Colors.black38, fontSize: 20, fontWeight: FontWeight.w500),),
          //   ),
          // ) : null,

          prefixIcon: isPrefixIcon
              ? Icon(
                  prefixIcon,
                  color: Theme.of(context).hintColor,
                  size: 20.sp,
                )
              : null,
          suffixIcon: isSuffixIcon
              ? InkWell(
                  onTap: suffixTap,
                  child: Icon(
                    suffixIcon,
                    color: Theme.of(context).hintColor,
                    size: 20.sp,
                  ))
              : null,
          border: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor.withOpacity(0.7),
                      width: isFilled ? 0 : 2),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor.withOpacity(0.2)),
                ),
          enabledBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor.withOpacity(0.7),
                      width: isFilled ? 0 : 2),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor.withOpacity(0.2)),
                ),
          focusedBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor.withOpacity(0.7),
                      width: isFilled ? 0 : 2),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).hintColor.withOpacity(0.2)),
                ),
          errorBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: const Color(0xffF79500), width: isFilled ? 0 : 2),
                )
              : null,
          focusedErrorBorder: border == true
              ? OutlineInputBorder(
                  borderRadius: radiusAll(radiusSet ?? 2.5),
                  borderSide: BorderSide(
                      color: const Color(0xffF79500), width: isFilled ? 0 : 2),
                )
              : null,
          errorStyle: AppTextStyle.text4(color: const Color(0xffF79500))),
    );
  }
}
