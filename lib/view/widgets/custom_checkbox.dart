import 'package:todo_app/res/color_manager/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isCheck;
  final Function(bool?)? onChanged;
  final double? scale;
  final Color? checkBg;
  const CustomCheckbox(
      {super.key,
      required this.isCheck,
      this.scale,
      required this.onChanged,
      this.checkBg});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topLeft,
      scale: scale ?? 1,
      child: Checkbox(
        splashRadius: 0,
        checkColor: Colors.white,
        fillColor: WidgetStatePropertyAll(
            isCheck ? checkBg ?? AppColors.primaryColor : Colors.transparent),
        side: BorderSide(color: Colors.black26, width: isCheck ? 0 : 2),
        value: isCheck,
        onChanged: onChanged,
      ),
    );
  }
}
