import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      this.child,
       this.backgroundColor,
      this.width,
      this.height,
      this.borderColor,
      this.borderRadius = 12, this.padding, this.margin, this.alignment});
  final Widget? child;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment ,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.transparent,
          width: 0),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius)),
      width: width,
      height: height,
      child: child,
    );
  }}