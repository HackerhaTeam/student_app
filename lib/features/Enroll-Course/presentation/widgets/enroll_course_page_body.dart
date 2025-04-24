import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_check_box.dart';
import 'package:student_hackerha/core/widgets/headers/introduction_header.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/buttons/big_next_button.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/connect_with_us_button.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/custom_text.dart';

class EnrollCoursePageBody extends StatefulWidget {
  const EnrollCoursePageBody({super.key, required this.onNext});
  final VoidCallback onNext;

  @override
  State<EnrollCoursePageBody> createState() => _EnrollCoursePageBodyState();
}

class _EnrollCoursePageBodyState extends State<EnrollCoursePageBody> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    final styles = context;
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;

    return Scaffold(
      floatingActionButton: BigNextButton(
        value: value,
        onPressed: widget.onNext,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            right: 20.w(context), left: 20.w(context), bottom: 85.h(context)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntroductionHeader(
                introText: " معلومات وشروط التسجيل",
                icon: PhosphorIcons.questionMark(),
              ),
              CustomText(
                content: content,
                title: "كود التفعيل:\n",
                subTitle:
                    "يمكنك الحصول على كود التفعيل من خلال شرائه من إحدى المراكز التي تبيعها لك",
              ),
              SizedBox(
                height: 16.h(context),
              ),
              ConnectWithUsButton(
                backgrounds: backgrounds,
                border: border,
              ),
              SizedBox(
                height: 16.h(context),
              ),
              CustomText(
                content: content,
                title: "مدة الدورة:\n",
                subTitle:
                    "عند تفعيل الدورة، يحق للمستخدم الوصول الكامل إلى محتوى الدورة، وذلك من تاريخ أول تسجيل باستخدام الكود وحتى موعد تقديم الامتحان الخاص بها.\n",
              ),
              CustomText(
                content: content,
                title: "خلال هذه الفترة يمكنك:\n",
                bullets: [
                  "متابعة جميع الدروس والوسائط التعليمية.",
                  "تقديم الامتحانات الخاص بالدورة.",
                  "الوصول لكافة الوسائط والملفات الداعمة.",
                ],
              ),
              CustomText(
                content: content,
                title: "بعد انتهاء المدة:\n",
                bullets: [
                  "لا يُسمح بإعادة الدخول لنفس الدورة إلا بتفعيلها \n    مجدداً عن طريق كود تفعيل جديد.",
                ],
              ),
              CustomText(
                content: content,
                title: "الملكية الفكرية:\n",
                subTitle:
                    "جميع المحتويات التعليمية، بما في ذلك المستندات، الفيديوهات، والوسائط الأخرى، هي ملكية حصرية لفريق \"هكرها\".\n",
              ),
              CustomText(
                content: content,
                title: "بذلك، يتعهد المستخدم بما يلي:\n",
                bullets: [
                  "استخدام المحتوى لأغراض شخصية فقط.",
                  "عدم نسخ، تصوير، أو إعادة توزيع أي جزء من\n    الدورة.",
                  "عدم تدريس أو مشاركة أي محتوى مع أي جهة أو\n    شخص، بأي وسيلة كانت، سواء كانت مباشرة أو عبر\n    الإنترنت، إلا بعد الحصول على موافقة خطية من\n    إدارة التطبيق."
                ],
              ),
              CustomText(
                content: content,
                title: "الملكية الفردية للحساب:\n",
                subTitle:
                    "بمجرد تفعيل الدورة على جهازك، لا يمكن فتح الحساب \n  على أي جهاز آخر.\n\n وفي حال الحاجة لنقل الحساب، يجب تقديم طلب  \nوالحصول على موافقة خطية رسمية من إدارة \n التطبيق.",
              ),
              SizedBox(
                height: 15.h(context),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        value = !value;
                      });
                    },
                    child: CustomCheckBox(
                      value: value,
                    ),
                  ),
                  SizedBox(height: 8.h(context)),
                  Text(
                    " أستوفي ما ذُكر وأنا في أتم الاستعداد!",
                    style: styles.xLabelLarge,
                  ),
                  SizedBox(height: 24.h(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
