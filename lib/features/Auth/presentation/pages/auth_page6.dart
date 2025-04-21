import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_page6_body.dart';

class AuthPage6 extends StatelessWidget {
  const AuthPage6({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return AuthPage6Body(backgrounds: backgrounds, onNext: onNext);
  }
}
