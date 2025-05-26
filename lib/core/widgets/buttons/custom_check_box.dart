import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
  });

  final bool value;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return Stack(
      alignment: Alignment.center,
      children: [
        checkContainer(24.w(context), 24.w(context), Colors.transparent,
            Border.all(), 8.r(context)),
        checkContainer(
            16.w(context),
            16.w(context),
            value ? backgrounds.secondaryBrand : Colors.white,
            null,
            5.r(context)),
      ],
    );
  }

  Container checkContainer(double? width, double? height, Color? color,
      BoxBorder? border, double radius) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(radius),
          border: border,
          color: color),
      // child: value
      //     ? const Icon(Icons.check, color: Colors.white, size: 18)
      //     : null,
    );
  }
}
