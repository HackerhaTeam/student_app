import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/sign_up_pages/sign_up_page3_body.dart';

class SignUpPage3 extends StatelessWidget {
  const SignUpPage3({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SignUpPage3Body(onNext: onNext);
  }
}
