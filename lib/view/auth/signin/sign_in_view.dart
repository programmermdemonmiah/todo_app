import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:todo_app/res/app_text_style/app_text_style.dart';
import 'package:todo_app/res/color_manager/app_colors.dart';
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
              S.phone,
              style: AppTextStyle.tittleBig4(),
            ),
            gapH(3),
            InternationalPhoneNumberInput(
              textFieldController: TextEditingController(),
              textStyle: const TextStyle(color: Colors.white),
              validator: (number) {
                if (number!.isEmpty) {
                  return 'Enter Phone number';
                }
                return null;
              },
              selectorTextStyle: const TextStyle(color: Colors.white),
              autoFocusSearch: true,
              hintText: "Enter your phone number",
              onInputChanged: (PhoneNumber number) {
                // controller.countryCodeController.text = number.dialCode!;
              },
              cursorColor: AppColors.primaryColor,
              scrollPadding: const EdgeInsets.all(8),
              textAlign: TextAlign.left,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                showFlags: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
