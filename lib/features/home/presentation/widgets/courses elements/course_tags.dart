import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/courses%20elements/courses_tag.dart';

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
    return SizedBox(
      height: 36.h(context),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tags.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(left: 8.w(context)),
            child: CoursesTag(
              background: background,
              appBorder: border,
              text: tags[index],
              isSelected: false,
              borderColor: Colors.transparent,
              backgroundColor: background.fill,
            ),
          ),
        ),
      ),
    );
  }
}
