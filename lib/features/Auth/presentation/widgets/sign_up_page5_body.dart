import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/introduction_header.dart';

class SignUpPage5Body extends StatefulWidget {
  const SignUpPage5Body({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<SignUpPage5Body> createState() => _SignUpPage5BodyState();
}

class _SignUpPage5BodyState extends State<SignUpPage5Body> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: FloatingNextButton(
        formKey: formKey,
        onNext: () {
          if (formKey.currentState!.validate()) {
            widget.onNext();
          }
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
                introText: " معلومات تسجيل الدخول",
                icon: PhosphorIcons.signIn(),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                child: Text(
                  "أدخل بريدك الإلكتروني وكلمة المرور لإنشاء حسابك الآن!",
                  style: styles.xParagraphLargeLose,
                ),
              ),
              Center(
                child: CustomTextField(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
