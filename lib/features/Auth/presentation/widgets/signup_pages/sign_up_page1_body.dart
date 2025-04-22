import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/core/widgets/custom_check_box.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/introduction_header.dart';

class SignUpPage1Body extends StatefulWidget {
  const SignUpPage1Body({
    super.key,
    required this.backgrounds,
    required this.onNext,
    required this.content,
  });

  final AppBackgrounds backgrounds;
  final AppContent content;
  final VoidCallback onNext;

  @override
  State<SignUpPage1Body> createState() => _SignUpPage1BodyState();
}

class _SignUpPage1BodyState extends State<SignUpPage1Body> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(right: 20.w(context), left: 20.w(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IntroductionHeader(
              styles: styles,
              introText: "  هل أنت مؤهل للتسجيل؟  ",
              icon: PhosphorIcons.questionMark(),
            ),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: styles.xParagraphLargeLose
                    .copyWith(color: widget.content.primary),
                children: [
                  const TextSpan(
                    text: "مرحبًا بك في تطبيقنا! 🎓💡\n\n",
                  ),
                  const TextSpan(
                      text:
                          "هذا التطبيق مصمم خصيصًا لطلاب كلية الهندسة المعلوماتية في كل من "),
                  TextSpan(
                    text: "جامعة حلب، قرطبة، إيبلا",
                    style: styles.xParagraphLargeLose.copyWith(
                      color: widget.content.brandSecondary,
                    ),
                  ),
                  const TextSpan(
                    text:
                        "،\nليكون رفيقك الذكي في رحلتك الأكاديمية، حيث يوفر لك \nتجربة سلسة ومتكاملة لإدارة معلوماتك الجامعية بسهولة.\n\n",
                  ),
                  const TextSpan(
                    text:
                        "لكن رؤيتنا لا تتوقف هنا! 🚀 نحن نعمل على توسيع آفاقنا إلى جامعات أخرى مستقبلًا، بهدف بناء منصة تعليمية متطورة تلبي احتياجات جميع الطلاب في مختلف المؤسسات الأكاديمية.\n\n",
                  ),
                  const TextSpan(
                    text:
                        "فإن كنت من كلية الهندسة المعلوماتية في جامعة حلب \nفانضم إلينا اليوم، وكن جزءًا من هذا المستقبل الواعد! ✨",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h(context),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value = !value;
                    });
                  },
                  child: CustomCheckBox(value: value, widget: widget),
                ),
                SizedBox(width: 8.w(context)),
                Text(
                  "أستوفي ما ذُكر وأنا في أتم الاستعداد!",
                  style: styles.xLabelLarge,
                ),
              ],
            ),
            SizedBox(
              height: 98.h(context),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 32.h(context)),
              child: CustomButton(
                  disabledColor: widget.backgrounds.brandDisabledPrimary,
                  disabled: value ? false : true,
                  borderRadius: 24.r(context),
                  height: 56.h(context),
                  width: 372.w(context),
                  color: widget.backgrounds.primaryBrand,
                  onPressed: widget.onNext,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "التالي",
                        style: styles.xLabelLarge.copyWith(
                            color: widget.content.brandDisabledPrimary),
                      ),
                      PhosphorIcon(PhosphorIcons.caretRight(),
                          size: 16.w(context),
                          color: widget.content.brandDisabledPrimary),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
