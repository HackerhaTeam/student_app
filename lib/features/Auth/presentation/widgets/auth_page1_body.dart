import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/core/widgets/custom_check_box.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/introduction_header.dart';

class AuthPage1Body extends StatefulWidget {
  const AuthPage1Body({
    super.key,
    required this.backgrounds,
    required this.onNext,
    required this.content,
  });

  final AppBackgrounds backgrounds;
  final AppContent content;
  final VoidCallback onNext;

  @override
  State<AuthPage1Body> createState() => _AuthPage1BodyState();
}

class _AuthPage1BodyState extends State<AuthPage1Body> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        color: widget.backgrounds.surfacePrimary,
        child: Padding(
          padding: EdgeInsets.only(right: 20.w(context)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionHeader(
                styles: styles,
                introText: "  هل أنت مؤهل للتسجيل؟  ",
                icon: PhosphorIcons.questionMark(),
              ),
              Text(
                textAlign: TextAlign.start,
                "مرحبًا بك في تطبيقنا! 🎓💡\n\nهذا التطبيق مصمم خصيصًا لطلاب كلية الهندسة المعلوماتية\nفي جامعة حلب فقط، ليكون رفيقك الذكي في رحلتك الأكاديمية، \nحيث يوفر لك تجربة سلسة ومتكاملة لإدارة معلوماتك الجامعية بسهولة.\n\nلكن رؤيتنا لا تتوقف هنا! 🚀 نحن نعمل على توسيع آفاقنا\nلنصل إلى جامعات أخرى مستقبلًا، بهدف بناء منصة تعليمية متطورة\nتلبي احتياجات جميع الطلاب في مختلف المؤسسات الأكاديمية.\n\nفإن كنت من كلية الهندسة المعلوماتية في جامعة حلب\nفانضم إلينا اليوم، وكن جزءًا من هذا المستقبل الواعد! ✨",
                style: styles.xParagraphLargeLose,
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
                height: 154.h(context),
              ),
              CustomButton(
                  disabledColor: widget.backgrounds.brandDisabledPrimary,
                  disabled: value ? false : true,
                  borderRadius: 24.r(context),
                  height: 56.h(context),
                  width: 372.w(context),
                  color: widget.backgrounds.primaryBrand,
                  onPressed: widget.onNext,
                  child: Text(
                    "التالي >",
                    style: styles.xLabelLarge
                        .copyWith(color: widget.content.brandDisabledPrimary),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
