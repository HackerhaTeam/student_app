import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/signup_pages/sign_up_page2_body.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.widget,
    required this.phoneController,
  });

  final SignUpPage2Body widget;

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextField(
        fieldType: FieldType.phoneNumber,
        keyboardType: TextInputType.number,
        label: "رقم الهاتف (واتس أب)",
        hint: "9XX XXX XXX",
        suffix: Padding(
          padding: EdgeInsets.only(left: 16.w(context)),
          child: SizedBox(
            width: 75.w(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 1,
                  height: 24.h(context),
                  color: widget.border.secondary,
                ),
                Text(
                  " 963+ ",
                  style: context.xLabelLarge,
                ),
                SvgPicture.asset(
                  AppAssets.flagIcon,
                  height: 18.h(context),
                  width: 24.w(context),
                )
              ],
            ),
          ),
        ),
        radius: 8.r(context),
        controller: phoneController,
        width: 372,
        height: 57,
      ),
    );
  }
}
