import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.iconDataPhosphor,
    required this.hight,
    required this.width,
  });
  final void Function()? onTap;
  final IconData iconDataPhosphor;
  final double hight;
  final double width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhosphorIcon(iconDataPhosphor),
    );
  }
}
