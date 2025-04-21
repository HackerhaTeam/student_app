import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

import 'package:student_hackerha/core/widgets/custom_text_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/introduction_header.dart';

class SignUpPage2Body extends StatefulWidget {
  const SignUpPage2Body({
    super.key,
    required this.backgrounds,
    required this.onNext,
    required this.border,
    required this.content,
  });

  final AppBackgrounds backgrounds;
  final AppBorders border;
  final AppContent content;
  final VoidCallback onNext;

  @override
  State<SignUpPage2Body> createState() => _SignUpPage2BodyState();
}

class _SignUpPage2BodyState extends State<SignUpPage2Body> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingNextButton(
          formKey: formKey,
          onNext: widget.onNext,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroductionHeader(
                  styles: styles,
                  introText: " عرفنا عن نفسك!",
                  icon: PhosphorIcons.user(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h(context)),
                  child: Text(
                    "أدخل معلوماتك الأساسية وساعدنا بالتعرف عليك.",
                    style: styles.xParagraphLargeLose,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: CustomTextField(
                    fieldType: FieldType.name,
                    label: "الاسم الكامل",
                    radius: 8.r(context),
                    controller: nameController,
                    width: 372,
                    height: 57,
                  ),
                ),
                SizedBox(
                  height: 32.h(context),
                ),
                Center(
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
                              style: styles.xLabelLarge,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
