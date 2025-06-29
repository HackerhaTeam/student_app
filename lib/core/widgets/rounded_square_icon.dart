import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class RoundedSquareIcon extends StatelessWidget {
  const RoundedSquareIcon({
    super.key,
    required this.icon,
    this.gradient,
    this.iconSize,
    this.size,  this.color,  this.iconColor,
  });
  final double? iconSize;
  final IconData icon;
  final double? size;
  final Gradient? gradient;
  final Color? color;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width:size==null? 44.w(context):size!.w(context)+4.w(context),
          height: size==null? 44.w(context):size!.w(context)+4.w(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r(context)),
              gradient: gradient),
        ),
        CustomCard(
          width: size==null? 40.w(context):size!.w(context),
          height: size==null? 40.w(context):size!.w(context),
          borderRadius: 16.r(context),
          backgroundColor: color?? backgroundColor.primaryBrand,
          child: PhosphorIcon(
            textDirection: TextDirection.ltr,
            icon,
            color: iconColor?? contentColor.primaryInverted,
            size: iconSize ?? 16.w(context),
          ),
        ),
      ],
    );
  }
}