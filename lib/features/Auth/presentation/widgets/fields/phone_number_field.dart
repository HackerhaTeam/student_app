import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.phoneController,
    required this.phoneFocusNode,
    this.onChanged,
    required this.phoneKey,
    required this.isPhoneSubmitted,
  });

  final TextEditingController phoneController;
  final FocusNode phoneFocusNode;
  final void Function(String)? onChanged;
  final GlobalKey<FormState> phoneKey;
  final bool isPhoneSubmitted;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: phoneKey,
      autovalidateMode: isPhoneSubmitted
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      child: Center(
        child: CustomTextField(
          onChanged: onChanged,
          focusNode: phoneFocusNode,
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
                    color: Theme.of(context).extension<AppBorders>()!.secondary,
                  ),
                  Text(
                    " 963+ ",
                    style: context.xLabelLarge,
                  ),
                  SvgPicture.asset(
                    AppImages.flagIcon,
                    height: 18.h(context),
                    width: 24.w(context),
                  )
                ],
              ),
            ),
          ),
          radius: 8.r(context),
          controller: phoneController,
          width: 372.w(context),
          height: 57,
        ),
      ),
    );
  }
}
