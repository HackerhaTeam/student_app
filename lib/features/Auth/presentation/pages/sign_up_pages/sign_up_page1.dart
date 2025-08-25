import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/sign_up_pages/sign_up_page1_body.dart';

class SignUpPage1 extends StatelessWidget {
  const SignUpPage1({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SignUpPage1Body(
      onNext: onNext,
    );
  }
}
