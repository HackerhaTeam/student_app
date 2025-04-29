import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';

class CircledSplashIcon extends StatelessWidget {
  const CircledSplashIcon({
    super.key,
    required this.iconDataPhosphor,
    required this.onTap,
  });

  final IconData iconDataPhosphor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    AppBackgrounds backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return SizedBox(
      height: 44.h(context),
      width: 44.w(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              height: 44.h(context),
              width: 44.w(context),
              decoration: BoxDecoration(
                  color: backgrounds.onSurfaceSecondary,
                  borderRadius: BorderRadius.circular(100.r(context)))),
          CustomIconButton(
            iconDataPhosphor: iconDataPhosphor,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
