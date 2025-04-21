import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_dropdownfield.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/day_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/gender_sellector.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/month_sellector.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/year_field.dart';

class AuthPage4Body extends StatefulWidget {
  const AuthPage4Body({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<AuthPage4Body> createState() => _AuthPage4BodyState();
}

class _AuthPage4BodyState extends State<AuthPage4Body> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedMonth;
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    // final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final styles = Theme.of(context).textTheme;

    return Scaffold(
      floatingActionButton: FloatingNextButton(
        formKey: formKey,
        onNext: () {
          widget.onNext();
          if (formKey.currentState!.validate()) {}
        },
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w(context), right: 20.w(context)),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IntroductionHeader(
                styles: styles,
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
                  DayField(dayController: dayController),
                  MonthSellector(
                    selectedMonth: selectedMonth,
                    onChanged: (value) {
                      setState(() {
                        selectedMonth = value;
                      });
                    },
                  ),
                  YearField(yearController: yearController)
                ],
              ),
              SizedBox(
                height: 24.h(context),
              ),
              GenderSellector(
                selectedGender: selectedGender,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
