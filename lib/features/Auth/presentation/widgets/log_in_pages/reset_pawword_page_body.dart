// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/buttons/float_next_button_with_dialog.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';
import 'package:student_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';

class ResetPasswordPageBody extends StatefulWidget {
  const ResetPasswordPageBody({super.key});

  @override
  State<ResetPasswordPageBody> createState() => _ResetPasswordPageBodyState();
}

class _ResetPasswordPageBodyState extends State<ResetPasswordPageBody> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      passwordFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final styles = context;
    return Scaffold(
      floatingActionButton: FloatNextButtonWithDialog(
        formKey: formKey,
        width: 139.w(context),
        buttonText: "إعادة التعيين",
        title: "تم إعادة تعيين كلمة المرور!",
        subtitle:
            "مبروك! تم تحديث كلمة المرور بنجاح. يمكنك الآن تسجيل الدخول باستخدام الكلمة الجديدة.",
        nextPage: MainNavigationPage(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: SafeArea(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircleIcon(
                backgroundColor: backgrounds.onSurfacePrimary,
                circleSize: 44.s(context),
                iconSize: 24.s(context),
                onTap: () => Navigator.of(context).pop(),
                iconAsset: AppImages.carretRightLight,
              ),
              IntroductionHeader(
                  introText: " قم بتعيين كلمة مرور جديدة",
                  icon: PhosphorIcons.password()),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                child: Text(
                  "أنشئ كلمة مرور جديدة. تأكد من أنها تختلف عن\nالسابقة لأغراض الأمان",
                  style: styles.xParagraphLargeLose,
                ),
              ),
              Center(
                child: CustomTextField(
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.text,
                  fieldType: FieldType.password,
                  label: "كلمة المرور الجديدة",
                  radius: 8.r(context),
                  controller: passwordController,
                ),
              ),
              SizedBox(
                height: 24.h(context),
              ),
              Center(
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  fieldType: FieldType.password,
                  hint: "أعد إدخال كلمة المرور",
                  radius: 8.r(context),
                  controller: confirmPasswordController,
                  customValidator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى تأكيد كلمة المرور';
                    }
                    if (value != passwordController.text) {
                      return 'كلمات المرور غير متطابقة';
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
