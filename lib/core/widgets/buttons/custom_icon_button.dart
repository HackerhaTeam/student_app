import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.iconDataPhosphor,
  });
  final void Function()? onTap;
  final IconData iconDataPhosphor;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return SizedBox(
      height: 44.h(context),
      width: 44.w(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: backgrounds.onSurfaceSecondary,
          ),
          InkWell(
            onTap: onTap,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: PhosphorIcon(
                size: 24.w(context),
                iconDataPhosphor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
