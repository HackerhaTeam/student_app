import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomSuccessDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String svgAssetPath;

  const CustomSuccessDialog({
    super.key,
    required this.title,
    required this.subtitle,
    required this.svgAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppBackgrounds>()!;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: 20.w(context),
      ),
      backgroundColor: bgColor.onSurfacePrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 24.w(context), vertical: 24.h(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svgAssetPath,
              height: 96.h(context),
              width: 115.w(context),
              fit: BoxFit.contain,
            ),
            SizedBox(height: 24.h(context)),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .xHeadingXLarge
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h(context)),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.xParagraphLargeLose,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
