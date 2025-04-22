// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_success_dialog.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/log_in_pages/log_in_page.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/pin_code_fields.dart';

class SignUpPage6Body extends StatefulWidget {
  const SignUpPage6Body({
    super.key,
    required this.backgrounds,
    required this.onNext,
  });

  final AppBackgrounds backgrounds;
  final VoidCallback onNext;

  @override
  State<SignUpPage6Body> createState() => _SignUpPage6BodyState();
}

class _SignUpPage6BodyState extends State<SignUpPage6Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();
  bool isButtonDisabled = true;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pinFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final styles = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: FloatingNextButton(
        width: 139.w(context),
        buttonText: "تحقق من الرمز",
        disabled: isButtonDisabled,
        formKey: formKey,
        onNext: () async {
          if (formKey.currentState!.validate()) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const CustomSuccessDialog(
                svgAssetPath: AppAssets.successImage,
                title: 'تم إنشاء حسابك بنجاح!',
                subtitle:
                    "أهلاً بك في عائلة هكرها، هنا تهكير المادة علينا والباقي عليك!",
              ),
            );
          }

          await Future.delayed(
            const Duration(seconds: 3),
          );

          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const LogInPage()),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w(context), right: 20.w(context)),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionHeader(
                styles: styles,
                introText: " أدخل رمز التحقق",
                icon: PhosphorIcons.numpad(),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                child: Text(
                  "لقد أرسلنا رمز إعادة تعيين إلى contact@gmail.com، أدخل الرمز المكون من 5 أرقام المذكور في البريد الإلكتروني.",
                  style: styles.xParagraphLargeLose,
                ),
              ),
              OTPInput(
                focusNode: pinFocusNode,
                borderColor: border.secondary,
                focusedBorderColor: border.primaryBrand,
                controller: otpController,
                onCompleted: (code) {
                  setState(() {
                    isButtonDisabled = false;
                  });
                  log("OTP Completed: $code");
                },
              ),
              SizedBox(height: 32.h(context)),
              Text(
                "إعادة إرسال الرمز",
                style: styles.xLabelLarge.copyWith(color: content.brandPrimary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
