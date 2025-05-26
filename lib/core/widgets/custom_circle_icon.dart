import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon({
    super.key,
    this.backgroundColor,
    this.icon,
    this.iconSize,
    this.onTap,
    this.iconColor,
    required this.circleSize,
    this.borderColor,
  });

  final Color? backgroundColor;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final void Function()? onTap;
  final double? circleSize;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border:
                Border.all( color: borderColor ?? Colors.transparent)),
        width: circleSize,
        height: circleSize,
        child: icon != null
            ? PhosphorIcon(
                textDirection: TextDirection.ltr,
                color: iconColor,
                icon!,
                size: iconSize,
              )
            : SizedBox(),
      ),
    );
  }
}