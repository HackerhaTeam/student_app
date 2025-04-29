import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/widgets.dart';

extension NavigationExtension on BuildContext {
  void navigateWithSlideTransition(Widget page) {
    Navigator.push(
      this,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ThemeSwitchingArea(child: page),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          final tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
