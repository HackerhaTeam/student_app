import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomIconButton extends StatelessWidget {
  const   CustomIconButton({
    super.key,
    this.onTap,
    required this.iconDataPhosphor,
    required this.size,  this.color,
  });
  final void Function()? onTap;
  final IconData iconDataPhosphor;
  final double size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
        
          PhosphorIcon(
            textDirection: TextDirection.ltr,
            color: color,
            iconDataPhosphor,
            size: size,
          ),
        ],
      ),
    );
    
  }
}
