
import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class CustomFadeSlideIn extends StatefulWidget {
  const CustomFadeSlideIn({
    super.key,
    required this.backgroundColor,
    required this.child, 
  });

  final AppBackgrounds backgroundColor;
  final Widget child;

  @override
  State<CustomFadeSlideIn> createState() => _CustomFadeSlideInState();
}

class _CustomFadeSlideInState extends State<CustomFadeSlideIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5700), () {
      if (mounted) _controller.forward();
    });
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(opacity: _fadeAnimation, child: widget.child),
    );
  }
}
