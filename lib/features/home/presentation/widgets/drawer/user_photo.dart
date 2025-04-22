import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    super.key,
    required this.background,
  });

  final AppBackgrounds background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w(context),
      height: 64.h(context),
      decoration: ShapeDecoration(
        color: background.onSurfaceSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: PhosphorIcon(PhosphorIcons.user()),
    );
  }
}
