import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
    required this.background,
    required this.width,
    required this.height,
  });

  final AppBackgrounds background;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: background.onSurfaceSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r(context)),
        ),
      ),
      child: PhosphorIcon(PhosphorIcons.user()),
    );
  }
}