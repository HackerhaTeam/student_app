import 'package:flutter/material.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_page3_body.dart';

class AuthPage3 extends StatelessWidget {
  const AuthPage3({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AuthPage3Body(onNext: onNext);
  }
}
