import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class CoursesHeader extends StatelessWidget {
  final AppBackgrounds background;

  const CoursesHeader({super.key, required this.background});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "عرض الكل",
            style: TextStyle(
              color: background.primaryBrand,
              fontSize: 14.fs(context),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "الدورات الجديدة",
            style: TextStyle(
              fontSize: 20.fs(context),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
