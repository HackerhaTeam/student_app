// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';

import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/core/widgets/text_field/custom_text_field.dart';
import 'package:student_hackerha/core/widgets/buttons/float_next_button_with_dialog.dart';
import 'package:student_hackerha/core/widgets/text_field/field_validators.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/log_in_pages/forget_password_page.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    final styles = context;

    return Scaffold(
      floatingActionButton: FloatNextButtonWithDialog(
        formKey: formKey,
        width: 141.w(context),
        buttonText: "تسجيل الدخول",
        title: "تم تسجيل دخولك!",
        subtitle:
            "أهلاً بك مجدداً معنا، شمر عن سواعدك وخلي تهكير المادة علينا.",
        nextPage: MainNavigationPage(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCircleIcon(
                  circleSize: 44.s(context),
                  iconSize: 24.s(context),
                  iconAsset: AppImages.carretRightLight,
                ),
                IntroductionHeader(
                  introText: " تسجيل الدخول",
                  icon: PhosphorIcons.signIn(),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                  child: Text(
                    "أدخل بريدك الإلكتروني وكلمة المرور لتسجيل دخولك.",
                    style: styles.xParagraphLargeLose,
                  ),
                ),
                Center(
                  child: CustomTextField(
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                    fieldType: FieldType.email,
                    label: "البريد الإلكتروني",
                    radius: 8.r(context),
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: 24.h(context),
                ),
                Center(
                  child: CustomTextField(
                    keyboardType: TextInputType.text,
                    fieldType: FieldType.password,
                    label: "كلمة المرور",
                    radius: 8.r(context),
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: 18.h(context),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    overlayColor: backgrounds.primaryBrand.withOpacity(0.2),
                  ),
                  onPressed: () {
                    context.navigateWithSlideTransition(ForgetPasswordPage());
                  },
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: styles.xLabelLarge.copyWith(color: content.primary),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
