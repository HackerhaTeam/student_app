import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_page2_body.dart';

class AuthPage2 extends StatelessWidget {
  const AuthPage2({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return AuthPage2Body(backgrounds: backgrounds, onNext: onNext);
  }
}
