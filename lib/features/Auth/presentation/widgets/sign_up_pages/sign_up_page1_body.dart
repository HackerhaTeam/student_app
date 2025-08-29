import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/buttons/custom_check_box.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/core/widgets/buttons/big_next_button.dart';

class SignUpPage1Body extends StatefulWidget {
  const SignUpPage1Body({
    super.key,
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<SignUpPage1Body> createState() => _SignUpPage1BodyState();
}

class _SignUpPage1BodyState extends State<SignUpPage1Body> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: BigNextButton(
          value: value,
          onPressed: widget.onNext,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 20.w(context), left: 20.w(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionHeader(
                introText: "  هل أنت مؤهل للتسجيل؟  ",
                icon: PhosphorIcons.questionMark(),
              ),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: context.xParagraphLargeLose
                      .copyWith(color: content.primary),
                  children: [
                    const TextSpan(
                      text: "مرحبًا بك في تطبيق هكرها\n\n",
                    ),
                    const TextSpan(
                        text:
                            "هذا التطبيق مصمم خصيصًا لطلاب كلية الهندسة المعلوماتية في  "),
                    TextSpan(
                      text: "جامعة حلب، ",
                      style: context.xParagraphLargeLose.copyWith(
                        color: content.brandSecondary,
                      ),
                    ),
                    const TextSpan(
                      text:
                          "ليكون رفيقك الذكي في رحلتك الأكاديمية، حيث يوفر لك تجربة سلسة ومتكاملة لإدارة معلوماتك الجامعية بسهولة.\n\n",
                    ),
                    const TextSpan(
                      text:
                          "لكن رؤيتنا لا تتوقف هنا! نحن نعمل على توسيع آفاقنا إلى جامعات أخرى مستقبلًا، بهدف بناء منصة تعليمية متطورة تلبي احتياجات جميع الطلاب في مختلف المؤسسات الأكاديمية.\n\n",
                    ),
                    const TextSpan(
                      text:
                          "فإن كنت من كلية الهندسة المعلوماتية في جامعة حلب \nفانضم إلينا اليوم، وكن جزءًا من هذا المستقبل الواعد!",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.h(context),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    value = !value;
                  });
                },
                child: Row(
                  children: [
                    CustomCheckBox(
                      value: value,
                    ),
                    SizedBox(width: 8.w(context)),
                    Text(
                      "أستوفي ما ذُكر وأنا في أتم الاستعداد!",
                      style: context.xLabelLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
