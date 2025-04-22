import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';

class CourseImage extends StatelessWidget {
  final AppBorders border;
  final AppBackgrounds background;
  final bool isNew;

  const CourseImage({
    super.key,
    required this.border,
    required this.background,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(21.r(context)),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset(
            AppImages.courseImage,
            width: double.infinity,
            height: 140.h(context),
            fit: BoxFit.cover,
          ),
          if (isNew)
            Padding(
              padding: EdgeInsets.all(8.w(context)),
              child: Container(
                height: 20.h(context),
                width: 60.w(context),
                color: background.negativeStrong,
                alignment: Alignment.center,
                child: Text(
                  "جديد",
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
