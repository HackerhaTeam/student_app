import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/course%20card/courses_tag.dart';
import 'package:student_hackerha/core/widgets/course%20card/icon_text_course_content.dart';

class CourseTags extends StatelessWidget {
  final List<String> tags;
  final AppBorders border;
  final AppBackgrounds background;

  const CourseTags({
    super.key,
    required this.tags,
    required this.border,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Row (spacing:12.w(context) ,
      children: [
        IconTextCourseContent(Icon: PhosphorIcons.circlesFour(), title: "دورة شاملة"),
        IconTextCourseContent(Icon: PhosphorIcons.student (), title: "+55 طالب"),
        IconTextCourseContent(Icon: PhosphorIcons.chalkboardTeacher(), title: "مدرّس واحد"),
      ],
    );
  }
}
