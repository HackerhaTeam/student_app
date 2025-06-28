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
    this.size, this.color, this.iconColor,
  });
  final double? size;
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width:size?? 44.w(context),
          height:size?? 44.w(context),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r(context)),
              gradient: gradient),
        ),
        CustomCard(
          width: 40.w(context),
          height: 40.w(context),
          borderRadius: 16.r(context),
          backgroundColor:color?? backgroundColor.primaryBrand,
          child: PhosphorIcon(
            textDirection: TextDirection.ltr,
            icon,
            color:iconColor?? contentColor.primaryInverted,
            size: size ?? 16.w(context), 
          ),
        ),
      ],
    );
  }
}
