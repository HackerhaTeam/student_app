import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/full_name_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/phone_number_field.dart';

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
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = context;

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
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntroductionHeader(
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
                FullNameField(
                    onSubmitted: (_) => phoneFocusNode.requestFocus(),
                    nameFocusNode: nameFocusNode,
                    nameController: nameController),
                SizedBox(
                  height: 24,
                ),
                PhoneNumberField(
                  phoneController: phoneController,
                  phoneFocusNode: phoneFocusNode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
