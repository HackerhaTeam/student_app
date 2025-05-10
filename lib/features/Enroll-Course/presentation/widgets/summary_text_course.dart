import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class SummaryTextCourse extends StatelessWidget {
  const SummaryTextCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
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
        SizedBox(height: 80),
      ],
    );
  }
}
