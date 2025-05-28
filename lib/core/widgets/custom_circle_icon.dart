import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon({
    super.key,
    this.backgroundColor,
    this.iconSize,
    this.onTap,
    this.iconColor,
    required this.circleSize,
    this.borderColor,
    this.iconAsset,
  });

  final Color? backgroundColor;
  final double? iconSize;
  final Color? iconColor;
  final void Function()? onTap;
  final double? circleSize;
  final Color? borderColor;
  final String? iconAsset;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(color: borderColor ?? Colors.transparent)),
        width: circleSize,
        height: circleSize,
        child: iconAsset != null
            ? Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                    color: iconColor,
                    width: iconSize,
                    height: iconSize,
                    iconAsset!))
            : SizedBox(),
      ),
    );
  }
}
