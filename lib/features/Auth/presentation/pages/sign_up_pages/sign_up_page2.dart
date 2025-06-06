import 'package:flutter/material.dart';

import 'package:student_hackerha/features/Auth/presentation/widgets/signup_pages/sign_up_page2_body.dart';

class SignUpPage2 extends StatelessWidget {
  const SignUpPage2({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SignUpPage2Body(
      onNext: onNext,
    );
  }
}
