import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';

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
      child: Container(
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
                  width: 1.0,
                ),
        ),
        child: Text(
          "  $text  ",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color:
                  isSelected ? background.surfacePrimary : appBorder.secondary),
        ),
      ),
    );
  }
}
