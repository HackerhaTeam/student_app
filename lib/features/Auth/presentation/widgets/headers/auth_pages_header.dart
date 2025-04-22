import 'package:flutter/material.dart';

import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/back_button.dart';

class AuthPagesHeader extends StatelessWidget {
  const AuthPagesHeader({
    super.key,
    required double progress,
    required this.backgrounds,
    required this.onBack,
    required this.currentPage,
  }) : _progress = progress;

  final double _progress;
  final AppBackgrounds backgrounds;
  final int currentPage;
  final VoidCallback onBack;
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    final primaryColor = backgrounds.primaryBrand;
    String headerText = "";
    if (currentPage == 0) {
      headerText = "توضيح هام";
    } else if (currentPage == 1) {
      headerText = "المعلومات والبيانات الشخصية";
    } else if (currentPage == 2) {
      headerText = "المعلومات والبيانات الجامعية";
    } else if (currentPage == 3) {
      headerText = "لضمان تجربة مخصصة مناسبة";
    } else if (currentPage == 4) {
      headerText = "سجل دخولك عبر بريدك الإلكتروني فقط";
    } else if (currentPage == 5) {
      headerText = "حماية وأمان حسابك";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 20.w(context),
        ),
        AuthBackButton(onBack: onBack),
        SizedBox(
          width: 28.w(context),
        ),
        Center(
          child: Column(
            children: [
              Text(
                headerText,
                style: styles.xLabelSmall,
              ),
              SizedBox(
                height: 8.r(context),
              ),
              SizedBox(
                width: 228.w(context),
                child: Stack(
                  children: [
                    Container(
                      decoration:
                          containerDecoration(context, Colors.grey[300]),
                      height: 6.h(context),
                      width: double.infinity,
                    ), // primaryColor
                    AnimatedContainer(
                      decoration: containerDecoration(context, primaryColor),
                      duration: const Duration(milliseconds: 300),
                      height: 6.h(context),
                      width: 228.w(context) * _progress,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration containerDecoration(BuildContext context, Color? color) {
    return BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(40.r(context)));
  }
}
