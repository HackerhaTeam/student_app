import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/full_name_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/phone_number_field.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';

class SignUpPage2Body extends StatefulWidget {
  const SignUpPage2Body({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<SignUpPage2Body> createState() => _SignUpPage2BodyState();
}

class _SignUpPage2BodyState extends State<SignUpPage2Body> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  bool isNameSubmitted = false;
  bool isPhoneSubmitted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingNextButton(
          formKey: formKey,
          onNext: () {
            FocusScope.of(context).unfocus();
            setState(() {
              isNameSubmitted = true;
              isPhoneSubmitted = true;
            });
            final isNameValid = nameKey.currentState?.validate() ?? false;
            final isPhoneValid = phoneKey.currentState?.validate() ?? false;
            final isFormValid = formKey.currentState?.validate() ?? false;
            if (isNameValid && isPhoneValid && isFormValid) {
              widget.onNext();
            }
          },
        ),
        body: SingleChildScrollView(
          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // autovalidateMode: isSubmitted
            //     ? AutovalidateMode.onUserInteraction
            //     : AutovalidateMode.disabled,
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
                    style: context.xParagraphLargeLose,
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                  key: nameKey,
                  autovalidateMode: isNameSubmitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: FullNameField(
                    // onChanged: (_) => setState(() {
                    //   isSubmitted = true;
                    // }),
                    onSubmitted: (_) {
                      // isNameSubmitted = true;
                      phoneFocusNode.requestFocus();
                    },
                    nameFocusNode: nameFocusNode,
                    nameController: nameController,
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                  key: phoneKey,
                  autovalidateMode: isPhoneSubmitted
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: PhoneNumberField(
                      phoneController: phoneController,
                      phoneFocusNode: phoneFocusNode,
                      onChanged: (_) => setState(() {})),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
