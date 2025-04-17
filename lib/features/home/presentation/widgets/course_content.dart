import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/home/presentation/widgets/course_tags.dart';

class CourseContent extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final String courseName;
  final String description;
  final List<String> tagsTitle;

  const CourseContent({
    super.key,
    required this.border,
    required this.background,
    required this.courseName,
    required this.description,
    required this.tagsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.w(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            courseName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.fs(context),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h(context)),
          Text(
            description,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 14.fs(context),
              color: Colors.grey[600],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 12.h(context)),
          CourseTags(
            tags: tagsTitle,
            border: border,
            background: background,
          ),
          SizedBox(height: 12.h(context)),
          CustomButton(
            onPressed: () {},
            borderRadius: 12.r(context),
            color: border.primaryBrand,
            height: 38.h(context),
            width: double.infinity,
            child: Text(
              "عرض التفاصيل",
              style: TextStyle(
                color: background.surfacePrimary,
                fontSize: 12.fs(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
