import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/courses/presentation/widgets/Course%20informations/floating_active_course_button.dart';

class SummaryCourse extends StatelessWidget {
  const SummaryCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;
    var background = Theme.of(context).extension<AppBackgrounds>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "حول الدورة",
          style: context.xHeadingLarge,
        ),
        SizedBox(height: 8),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 2.w(context),
                color: Theme.of(context).extension<AppBorders>()!.primaryBrand,
              ),
              SizedBox(width: 8.w(context)),
              Expanded(
                child: Text(
                  "هذه الدورة موجهة لطلاب كلية الهندسة المعلوماتية بجامعة حلب، سواءً كانوا في السنة الدراسية الأولى أو ممن حملوا المادة سابقًا.",
                  style: context.xParagraphMedium
                      .copyWith(color: content.secondary),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        ActiveCourseButton(),
        
        SizedBox(height: 16),
        Text(
          "يمكنك مشاهدة الفيديو التعريفي التالي لمعرفة المزيد حول هذه الدورة:",
          style: context.xParagraphMedium,
        ),
        SizedBox(height: 16),
        Container(
          height: 216,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 158, vertical: 80),
          decoration: ShapeDecoration(
            color: const Color(0x70222222),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: CustomCircleIcon(
              backgroundColor: background.containerStatic,
            iconAsset: AppImages.carretRightLight, circleSize: 16,
            )
               // icon: PhosphorIcons.play(), onTap: () {}, circleSize: 56.w(context),),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "شرح دورة البرمجة بلغة ++C وأهميتها لتطوير المهارات.",
          style: context.xParagraphSmall,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
