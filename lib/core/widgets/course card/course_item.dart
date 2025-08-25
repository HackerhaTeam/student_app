import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_content.dart';
import 'package:student_hackerha/core/widgets/course%20card/course_image.dart';
import 'package:student_hackerha/core/widgets/shimmer/course_shimmer.dart';
import 'package:student_hackerha/features/courses/domain/Entity/course.dart';
import 'package:student_hackerha/features/home/domain/Entity/course_entity.dart';

class CoursesItem extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;

  final List<String> tagsTitle;

  final Course course;
 final double? width;

  const CoursesItem({
    super.key,
    required this.course,
    required this.border, 
    required this.background,
    required this.tagsTitle, this.width,
  });

  @override
  Widget build(BuildContext context) {
    
    var inHours2 = (DateTime.now().difference(course.updatedAt)).inDays;
    return CustomCard(
      width:width ?? MediaQuery.of(context).size.width * 0.75,
     borderRadius:21.r(context),
      backgroundColor:Colors.transparent,
      borderColor: border.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseImage(url: course.image,
            border: border,
            background: background,
            isNew:inHours2< 5,
          ),
          CourseContent(course: course,
            border: border,
            background: background,
            courseName: course.name,
            description: course.description,
            tagsTitle: tagsTitle,
          ),
        ],
      ),
    );
  }
}
