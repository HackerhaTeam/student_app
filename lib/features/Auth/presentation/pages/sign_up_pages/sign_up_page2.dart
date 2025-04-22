import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/signup_pages/sign_up_page2_body.dart';

class SignUpPage2 extends StatelessWidget {
  const SignUpPage2({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final content = Theme.of(context).extension<AppContent>()!;
    return SignUpPage2Body(
      backgrounds: backgrounds,
      onNext: onNext,
      border: border,
      content: content,
    );
  }
}
