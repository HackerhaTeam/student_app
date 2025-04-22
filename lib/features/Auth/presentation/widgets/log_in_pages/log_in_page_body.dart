// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_success_dialog.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/sign_up_wrapper.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/back_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/headers/introduction_header.dart';

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
    final content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final styles = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingNextButton(
          width: 141.w(context),
          buttonText: "تسجيل الدخول",
          formKey: formKey,
          onNext: () async {
            if (formKey.currentState!.validate()) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const CustomSuccessDialog(
                  svgAssetPath: AppAssets.successImage,
                  title: "تم تسجيل دخولك!",
                  subtitle:
                      "أهلاً بك مجدداً معنا، شمر عن سواعدك وخلي تهكير المادة علينا.",
                ),
              );
            }

            await Future.delayed(
              const Duration(seconds: 3),
            );

            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AuthWrapper()),
            );
          }),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthBackButton(onBack: () {}),
                IntroductionHeader(
                  styles: styles,
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
                Text(
                  "هل نسيت كلمة المرور؟",
                  style: styles.xLabelLarge,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
