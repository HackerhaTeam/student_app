import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_page4_body.dart';

class AuthPage4 extends StatelessWidget {
  const AuthPage4({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AuthPage4Body(onNext: onNext);
  }
}
