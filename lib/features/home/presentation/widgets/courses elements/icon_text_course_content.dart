import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class IconTextCourseContent extends StatelessWidget {
  const IconTextCourseContent(
      {super.key, required this.Icon, required this.title});

  final PhosphorIconData Icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;
    return Row(children: [
      PhosphorIcon(Icon, size: 16.w(context),color:  content.secondary,),
      SizedBox(width: 2.w(context)),
      Text(
        title,
        style: context.xLabelSmall.copyWith(color: content.secondary),
      )
    ]);
  }
}
//Wrap(direction: Axis.horizontal,children: [],)
