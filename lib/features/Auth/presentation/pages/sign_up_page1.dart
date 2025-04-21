import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/sign_up_page1_body.dart';

class SignUpPage1 extends StatelessWidget {
  const SignUpPage1({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    return SignUpPage1Body(
      backgrounds: backgrounds,
      onNext: onNext,
      content: content,
    );
  }
}
