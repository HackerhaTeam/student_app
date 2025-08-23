import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';
import 'package:student_hackerha/features/Auth/presentation/pages/sign_up_pages/verification_page.dart';
import 'package:student_hackerha/core/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';

class ForgetPasswordPageBody extends StatefulWidget {
  const ForgetPasswordPageBody({super.key});

  @override
  State<ForgetPasswordPageBody> createState() => _ForgetPasswordPageBodyState();
}

class _ForgetPasswordPageBodyState extends State<ForgetPasswordPageBody> {
  final TextEditingController emailController = TextEditingController();
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
    final styles = context;
    return Scaffold(
      floatingActionButton: FloatingNextButton(
        formKey: formKey,
        onNext: () {
          if (formKey.currentState!.validate()) {
            context.navigateWithSlideTransition(VerificationPage(
              isSignIn: true,
            ));
          }
        },
        width: 192.w(context),
        buttonText: "إعادة تعيين كلمة المرور",
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w(context),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCircleIcon(
                iconSize: 24.s(context),
                backgroundColor: backgrounds.onSurfacePrimary,
                circleSize: 44.s(context),
                onTap: () => Navigator.of(context).pop(),
                iconAsset: AppImages.carretRightLight,
              ),
              IntroductionHeader(
                  introText: " هل نسيت كلمة المرور؟",
                  icon: PhosphorIcons.password()),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                child: Text(
                  "يرجى إدخال بريدك الإلكتروني لتتمكن من إعادة تعيين كلمة المرور.",
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
              )
            ],
          ),
        ),
      )),
    );
  }
}
