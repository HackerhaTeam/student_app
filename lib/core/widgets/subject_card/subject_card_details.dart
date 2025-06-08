import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/subject_card/custom_icon_text.dart';

class SubjectCardDetails extends StatelessWidget {
  const SubjectCardDetails({super.key, required this.isBank});
  final bool isBank;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconText(
            text: 'سنة أولى - فصل أول', icon: PhosphorIcons.student()),
        SizedBox(height: 12.h(context)),
        isBank
            ? Row(
                children: [
                  CustomIconText(
                      text: '5 اختبارات', icon: PhosphorIcons.exam()),
                  SizedBox(width: 12.w(context)),
                  CustomIconText(
                      text: '50 سؤال', icon: PhosphorIcons.sealQuestion()),
                ],
              )
            : CustomIconText(
                text: 'اسم الدرس نقوم بكتابته هنا ...',
                icon: PhosphorIcons.bookBookmark()),
      ],
    );
  }
}
