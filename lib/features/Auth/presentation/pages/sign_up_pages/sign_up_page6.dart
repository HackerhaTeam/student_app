import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/signup_pages/sign_up_page6_body.dart';

class SignUpPage6 extends StatelessWidget {
  const SignUpPage6({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return SignUpPage6Body(backgrounds: backgrounds, onNext: onNext);
  }
}
