import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/constants/assets.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/core/widgets/custom_check_box.dart';

class AuthPage1Body extends StatefulWidget {
  const AuthPage1Body({
    super.key,
    required this.backgrounds,
    required this.onNext,
  });

  final AppBackgrounds backgrounds;
  final VoidCallback onNext;

  @override
  State<AuthPage1Body> createState() => _AuthPage1BodyState();
}

class _AuthPage1BodyState extends State<AuthPage1Body> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgrounds.surfacePrimary,
      child: Padding(
        padding: EdgeInsets.only(right: 20.w(context)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 26.h(context), bottom: 8.h(context)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.questionIcon,
                    height: 44.h(context),
                    width: 44.w(context),
                  ),
                  Text(
                    "  هل أنت مؤهل للتسجيل؟  ",
                    style: TextStyle(
                      fontSize: 24.fs(context),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Text(
              textAlign: TextAlign.start,
              "مرحبًا بك في تطبيقنا! 🎓💡\n\nهذا التطبيق مصمم خصيصًا لطلاب كلية الهندسة المعلوماتية\nفي جامعة حلب فقط، ليكون رفيقك الذكي في رحلتك الأكاديمية، \nحيث يوفر لك تجربة سلسة ومتكاملة لإدارة معلوماتك الجامعية بسهولة.\n\nلكن رؤيتنا لا تتوقف هنا! 🚀 نحن نعمل على توسيع آفاقنا\nلنصل إلى جامعات أخرى مستقبلًا، بهدف بناء منصة تعليمية متطورة\nتلبي احتياجات جميع الطلاب في مختلف المؤسسات الأكاديمية.\n\nفإن كنت من كلية الهندسة المعلوماتية في جامعة حلب\nفانضم إلينا اليوم، وكن جزءًا من هذا المستقبل الواعد! ✨",
              style: TextStyle(
                fontSize: 16.fs(context),
                fontWeight: FontWeight.w400,
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
                  style: TextStyle(
                    fontSize: 16.fs(context),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 154.h(context),
            ),
            if (value == true)
              CustomButton(
                  borderRadius: 24.r(context),
                  height: 56.h(context),
                  width: 372.w(context),
                  color: widget.backgrounds.primaryBrand,
                  onPressed: widget.onNext,
                  child: Text(
                    "التالي >",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.fs(context),
                      fontWeight: FontWeight.w400,
                    ),
                  ))
          ],
        ),
      ),
    );
  }
}
