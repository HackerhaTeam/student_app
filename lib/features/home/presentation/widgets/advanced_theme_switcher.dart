// ignore_for_file: use_build_context_synchronously

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/manager/theme_cubit/theme_cubit.dart';
import 'package:student_hackerha/core/themes/app_theme.dart';

class AdvancedThemeSwitcher extends StatefulWidget {
  final Function()? onThemeChanged;
  final Duration animationDuration;

  const AdvancedThemeSwitcher({
    super.key,
    this.onThemeChanged,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<AdvancedThemeSwitcher> createState() => _AdvancedThemeSwitcherState();
}

class _AdvancedThemeSwitcherState extends State<AdvancedThemeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconController;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _iconController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );
  }

  @override
  void dispose() {
    _iconController.dispose();
    super.dispose();
  }

  void _toggleTheme(BuildContext context) {
    if (_isAnimating) return;
    _isAnimating = true;

    final isDarkModeEnabled = context.read<ThemeCubit>().state;
    final newMode = !isDarkModeEnabled;
    final switcher = ThemeSwitcher.of(context);

    _iconController.forward(from: 0);

    switcher.changeTheme(
      theme: newMode ? AppTheme.dark : AppTheme.light,
      isReversed: !newMode,
    );

    Future.delayed(widget.animationDuration, () {
      if (mounted) {
        context.read<ThemeCubit>().toggleTheme();
        widget.onThemeChanged?.call();
        _isAnimating = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      clipper: const ThemeSwitcherCircleClipper(),
      builder: (context) {
        return BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkModeEnabled) {
            return GestureDetector(
              onTap: () => _toggleTheme(context),
              child: ScaleTransition(
                scale: Tween(begin: 0.8, end: 1.0).animate(
                  CurvedAnimation(
                    parent: _iconController,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: AnimatedSwitcher(
                  duration: widget.animationDuration ~/ 2,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    );
                  },
                  child: isDarkModeEnabled
                      ? RotationTransition(
                          turns: AlwaysStoppedAnimation(1 / 360),
                          child: PhosphorIcon(
                            PhosphorIcons.moonStars(),
                            key: ValueKey<bool>(isDarkModeEnabled),
                            size: 28,
                          ),
                        )
                      : PhosphorIcon(
                          PhosphorIcons.sunDim(),
                          key: ValueKey<bool>(isDarkModeEnabled),
                          size: 28,
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
