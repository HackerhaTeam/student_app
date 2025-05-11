import 'package:flutter/material.dart';

class CustomScaleAnimation extends StatefulWidget {
  const CustomScaleAnimation(
      {super.key, required this.child, required this.duration});

  final Widget child;
  final Duration duration;
  @override
  State<CustomScaleAnimation> createState() => _CustomScaleAnimationState();
}

class _CustomScaleAnimationState extends State<CustomScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Duration duration;
  late Widget child;
  @override
  void initState() {
    super.initState();

    duration = widget.duration;
    child = widget.child;
    _controller = AnimationController(vsync: this, duration: duration);

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: child,
    );
  }
}
