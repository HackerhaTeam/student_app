import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/detiles_item.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/lesson_card.dart';

class DetailesSection extends StatelessWidget {
  const DetailesSection({super.key});
  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "محتويات الدورة",
            style: context.xHeadingLarge,
          ),
        ),
        Text(
          "البيانات الرئيسية",
          style: context.xHeadingSmall.copyWith(color: content.secondary),
        ),
        SizedBox(
          height: 12,
        ),
        Wrap(
          spacing: 8.w(context),
          runSpacing: 8.w(context),
          children: [
            DetilesItem(
                title: 'مدة الدورة',
                value: "${4} س",
                icon: PhosphorIcons.clock()),
            DetilesItem(
                title: 'عدد مقاطع',
                value: "${15}",
                icon: PhosphorIcons.clock()),
            DetilesItem(
                title: 'عدد الملفات المرفقة',
                value: "${5}",
                icon: PhosphorIcons.clock()),
            DetilesItem(
                title: 'عدد كويزات',
                value: "${2}",
                icon: PhosphorIcons.clock()),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "الجلسات",
                  textAlign: TextAlign.start,
                  style:
                      context.xHeadingSmall.copyWith(color: content.secondary),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: const LessonCard(),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
