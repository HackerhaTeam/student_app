import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/academic_year_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/acadenic_year_sellector.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/university_sellector.dart';

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
    final styles = context;

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
              UniversitySellector(
                selectedUniversity: selectedUniversity,
                onChanged: (val) {
                  setState(() {
                    selectedUniversity = val;
                  });
                },
              ),
              SizedBox(height: 24.h(context)),
              AcademicYearSellector(
                selectedYear: selectedYear,
                onChanged: (val) {
                  setState(() {
                    selectedYear = val;
                  });
                },
              ),
              SizedBox(height: 24.h(context)),
              AcademicYearField(numberController: numberController),
            ],
          ),
        ),
      ),
    );
  }
}
