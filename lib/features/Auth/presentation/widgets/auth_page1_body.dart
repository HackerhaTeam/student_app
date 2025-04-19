import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class AuthPage1Body extends StatelessWidget {
  const AuthPage1Body({
    super.key,
    required this.backgrounds,
  });

  final AppBackgrounds backgrounds;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgrounds.primaryBrand,
      child: const Center(child: Text("Nice background color!")),
    );
  }
}
