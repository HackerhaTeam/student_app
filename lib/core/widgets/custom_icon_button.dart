import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.iconDataPhosphor,
    this.iconColor,
  });
  final void Function()? onTap;
  final IconData iconDataPhosphor;

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: PhosphorIcon(
        iconDataPhosphor,
        color: iconColor,
      ),
    );
  }
}
