import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({
    super.key,
    this.backgrounds,
    required this.iconDataPhosphor, required this.size,
  });

  final AppBackgrounds? backgrounds;
  final IconData iconDataPhosphor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
    borderRadius: BorderRadius.circular(16),
      onTap: () {
        
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: backgrounds?.onSurfaceSecondary,
          ),
          PhosphorIcon(iconDataPhosphor,
      size: size,
      ),
         
        ],
      ),
    );
  }
}
