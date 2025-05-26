import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.child,
      required this.backgroundColor,
      this.width,
      this.height,
      this.borderColor,
      this.borderRadius = 12});
  final Widget? child;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final Color? borderColor;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      width: width,
      height: height,
      child: child,
    );
  }
}
