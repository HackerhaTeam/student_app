import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/day_field.dart';
import 'package:student_hackerha/core/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/gender_sellector.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/month_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/year_field.dart';

class SignUpPage4Body extends StatefulWidget {
  const SignUpPage4Body({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<SignUpPage4Body> createState() => _SignUpPage4BodyState();
}

class _SignUpPage4BodyState extends State<SignUpPage4Body> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> dayKey = GlobalKey<FormState>();
  final GlobalKey<FormState> monthKey = GlobalKey<FormState>();
  final GlobalKey<FormState> yearKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderKey = GlobalKey<FormState>();
  final FocusNode dayFocusNode = FocusNode();
  final FocusNode monthFocusNode = FocusNode();
  final FocusNode yearFocusNode = FocusNode();
  bool daySubmitted = false;
  bool monthSubmitted = false;
  bool yearSubmitted = false;
  bool genderSubmitted = false;
  String? selectedMonth;
  String? selectedGender;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      dayFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final styles = context;

    return Scaffold(
      floatingActionButton: FloatingNextButton(
        formKey: formKey,
        onNext: () {
          setState(() {
            daySubmitted = true;
            monthSubmitted = true;
            yearSubmitted = true;
            genderSubmitted = true;
          });
          final dayValidate = dayKey.currentState?.validate() ?? false;
          final monthValidate = monthKey.currentState?.validate() ?? false;
          final yearValidate = yearKey.currentState?.validate() ?? false;
          final genderValidate = genderKey.currentState?.validate() ?? false;
          final isFormValid = formKey.currentState?.validate() ?? false;
          if (dayValidate &&
              monthValidate &&
              yearValidate &&
              genderValidate &&
              isFormValid) {
            widget.onNext();
          }
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w(context), right: 20.w(context)),
          child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IntroductionHeader(
                  introText: " معلومات إضافية",
                  icon: PhosphorIcons.userPlus(),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 8.h(context), bottom: 32.h(context)),
                  child: Text(
                    "أدخل تاريخ ميلادك وحدد الجنس لضمان تجربة مخصصة تناسبك.",
                    style: styles.xParagraphLargeLose,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DayField(
                      onSubmitted: (p0) {
                        monthFocusNode.requestFocus();
                      },
                      onChanged: (p0) {
                        // formKey.currentState!.validate();
                      },
                      dayController: dayController,
                      focusNode: dayFocusNode,
                      dayKey: dayKey,
                      daySubmitted: daySubmitted,
                    ),
                    MonthField(
                      onSubmitted: (p0) {
                        yearFocusNode.requestFocus();
                      },
                      monthController: monthController,
                      focusNode: monthFocusNode,
                      monthKey: monthKey,
                      monthSubmitted: monthSubmitted,
                    ),
                    YearField(
                      focusNode: yearFocusNode,
                      yearController: yearController,
                      onChanged: (p0) {
                        // formKey.currentState!.validate();
                      },
                      yearKey: yearKey,
                      yearSubmitted: yearSubmitted,
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                GenderSellector(
                  selectedGender: selectedGender,
                  onChanged: (value) {
                    // formKey.currentState!.validate();
                    setState(() {
                      selectedGender = value;
                    });
                  },
                  genderKey: genderKey,
                  genderSubmitted: genderSubmitted,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
