import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_page1_body.dart';

class AuthPage1 extends StatelessWidget {
  const AuthPage1({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    return AuthPage1Body(
      backgrounds: backgrounds,
      onNext: onNext,
      content: content,
    );
  }
}
