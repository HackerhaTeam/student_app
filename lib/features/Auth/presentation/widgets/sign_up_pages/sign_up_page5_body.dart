import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/email_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/password_field.dart';

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
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool emailSubmitted = false;
  bool passwordSubmitted = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = context;
    return Scaffold(
      floatingActionButton: FloatingNextButton(
        formKey: formKey,
        onNext: () {
          setState(() {
            emailSubmitted = true;
            passwordSubmitted = true;
          });
          final emailValidate = emailKey.currentState?.validate() ?? false;
          final passwordValidate =
              passwordKey.currentState?.validate() ?? false;
          final isFormValid = formKey.currentState?.validate() ?? false;
          if (emailValidate && passwordValidate && isFormValid) {
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
              EmailField(
                  emailKey: emailKey,
                  emailSubmitted: emailSubmitted,
                  passwordFocusNode: passwordFocusNode,
                  emailFocusNode: emailFocusNode,
                  emailController: emailController),
              SizedBox(
                height: 24.h(context),
              ),
              PasswordField(
                  passwordKey: passwordKey,
                  passwordSubmitted: passwordSubmitted,
                  passwordFocusNode: passwordFocusNode,
                  passwordController: passwordController)
            ],
          ),
        ),
      ),
    );
  }
}
