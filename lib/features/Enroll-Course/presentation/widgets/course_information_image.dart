import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';

class CourseInformationImage extends StatelessWidget {
  const CourseInformationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.58,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.informationCourse),
              fit: BoxFit.fill)),
    );
  }
}
