import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CoursesTag extends StatelessWidget {
  const CoursesTag({
    super.key,
    required this.background,
    required this.appBorder,
    required this.text,
    this.isSelected = false,
    this.onTap,
    required this.borderColor,
    this.backgroundColor,
  });

  final AppBackgrounds background;
  final AppBorders appBorder;
  final String text;
  final bool isSelected;
  final void Function()? onTap;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r(context)),
      child: Container(height:36 ,
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16.w(context)),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r(context)),
          color: backgroundColor ??
              (isSelected
                  ? background.primaryBrand
                  : background.surfacePrimary),
          border: isSelected
              ? null
              : Border.all(
                  color: borderColor, 
                  width: 1.0.w(context),
                ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "  $text  ",
            style:context.xLabelMedium.copyWith(
                color:
                    isSelected ? background.surfacePrimary : appBorder.secondary),
          ),
        ),
      ),
    );
  }
}
