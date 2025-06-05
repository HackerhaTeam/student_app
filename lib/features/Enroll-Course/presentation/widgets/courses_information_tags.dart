import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class CoursesInformationTags extends StatelessWidget {
  const CoursesInformationTags({super.key, required this.tags});
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w(context),
      runSpacing: 8.w(context),
      children: tags.map((tag) => _buildTagItem(context, tag)).toList(),
    );
  }

  Widget _buildTagItem(BuildContext context, String tag) {
    return CustomCard(
        alignment: Alignment.center,
        height: 34,
        width: 78.w(context),
        backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.fill,
        borderRadius: 4.w(context),
        child: Text(
          tag,
          style: context.xLabelSmall,
        ));
  }
}
