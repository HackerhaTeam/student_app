// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class BackgroundIconMyAccount extends StatelessWidget {
  const BackgroundIconMyAccount(
      {super.key, required this.background, required this.icon});

  final AppBackgrounds background;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w(context)),
      decoration: ShapeDecoration(
        color: background.primaryBrand,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r(context)),
        ),
      ),
      child: SizedBox(
        width: 24,
        height: 24,
        child: PhosphorIcon(icon, color: background.onSurfacePrimary),
      ),
    );
  }
}
