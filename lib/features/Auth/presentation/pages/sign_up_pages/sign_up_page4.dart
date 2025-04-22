import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/signup_pages/sign_up_page4_body.dart';

class SignUpPage4 extends StatelessWidget {
  const SignUpPage4({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SignUpPage4Body(onNext: onNext);
  }
}
