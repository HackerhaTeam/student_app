import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({
    super.key,
    this.backgrounds,
    required this.iconDataPhosphor,
    required this.size, required this.onTap,
  });

  final AppBackgrounds? backgrounds;
  final IconData iconDataPhosphor;
  final double size;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: backgrounds?.onSurfaceSecondary,
          ),
          PhosphorIcon(
            iconDataPhosphor,
            size: size,
          ),
        ],
      ),
    );
  }
}
