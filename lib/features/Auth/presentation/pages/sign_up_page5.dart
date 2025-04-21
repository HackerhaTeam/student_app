import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/sign_up_page5_body.dart';

class SignUpPage5 extends StatelessWidget {
  const SignUpPage5({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return SignUpPage5Body(onNext: onNext);
  }
}
