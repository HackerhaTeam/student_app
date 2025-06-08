import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';

class SubjectCardImage extends StatelessWidget {
  const SubjectCardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        AppImages.courseImage,
        fit: BoxFit.fill,
        height: 112.h(context),
        width: 145.w(context),
      ),
    );
  }
}
