import 'package:flutter/material.dart';

class CustomFadeAnimation extends StatefulWidget {
  const CustomFadeAnimation(
      {super.key,
      required this.child,
      required this.startFadeDuration,
      required this.speedFade});
  final Widget child;
  final Duration startFadeDuration;
  final Duration speedFade;
  @override
  State<CustomFadeAnimation> createState() => _CustomFadeAnimationState();
}

class _CustomFadeAnimationState extends State<CustomFadeAnimation> {
  bool _visible = false;
  late Duration duration;

  @override
  void initState() {
    duration = widget.startFadeDuration;
    super.initState();
    Future.delayed(duration, () {
      if (mounted) {
        setState(
          () {
            _visible = true;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.speedFade,
      opacity: _visible ? 1.0 : 0.0,
      curve: Curves.easeInOut,
      child: widget.child,
    );
  }
}
