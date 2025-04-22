import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/day_field.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/floating_next_button.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/gender_sellector.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/fields/month_sellector.dart';
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
  final TextEditingController yearController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FocusNode dayFocusNode = FocusNode();

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
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DayField(
                    dayController: dayController,
                    focusNode: dayFocusNode,
                  ),
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
