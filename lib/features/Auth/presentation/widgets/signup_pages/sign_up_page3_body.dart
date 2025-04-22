import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/Custom_DropdownField.dart';
import 'package:student_hackerha/core/widgets/custom_text_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/headers/introduction_header.dart';

class SignUpPage3Body extends StatefulWidget {
  const SignUpPage3Body({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<SignUpPage3Body> createState() => _SignUpPage3BodyState();
}

class _SignUpPage3BodyState extends State<SignUpPage3Body> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController numberController = TextEditingController();

  String? selectedUniversity;
  String? selectedYear;

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
        padding: EdgeInsets.only(right: 20.w(context), left: 20.w(context)),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionHeader(
                styles: styles,
                introText: " أخبرنا عن مسيرتك الأكاديمية!",
                icon: PhosphorIcons.student(),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                child: Text(
                  "زوّدنا بتفاصيل جامعتك لنقدّم لك محتوى مخصصًا!",
                  style: styles.xParagraphLargeLose,
                ),
              ),
              SizedBox(
                height: 59.h(context),
                child: Center(
                  child: CustomDropdown(
                    label: "الجامعة",
                    items: [
                      'جامعة حلب',
                      'جامعة قرطبة',
                      'جامعة إيبلا',
                      'جامعة الشهباء'
                    ],
                    selectedItem: selectedUniversity,
                    onChanged: (val) {
                      setState(() {
                        selectedUniversity = val;
                      });
                    },
                    type: DropdownType.university,
                  ),
                ),
              ),
              SizedBox(height: 24.h(context)),
              SizedBox(
                height: 59.h(context),
                child: Center(
                  child: CustomDropdown(
                    label: "السنة الدراسية",
                    items: [
                      "الأولى",
                      "الثانية",
                      "الثالثة",
                      "الرابعة",
                      "الخامسة"
                    ],
                    selectedItem: selectedYear,
                    onChanged: (val) {
                      setState(() {
                        selectedYear = val;
                      });
                    },
                    type: DropdownType.academicYear,
                  ),
                ),
              ),
              SizedBox(height: 24.h(context)),
              SizedBox(
                height: 56.h(context),
                child: Center(
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    fieldType: FieldType.academicYear,
                    label: "الرقم الجامعي",
                    radius: 8.r(context),
                    controller: numberController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
