import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/auth_page1_body.dart';

class AuthPage1 extends StatelessWidget {
  const AuthPage1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;
    return AuthPage1Body(backgrounds: backgrounds);
  }
}
