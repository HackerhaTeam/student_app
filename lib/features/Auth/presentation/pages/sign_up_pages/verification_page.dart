import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/Auth/presentation/widgets/signup_pages/verification_page_body.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({
    super.key,
    required this.isSignIn,
  });
  final bool isSignIn;
  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    return VerificationPageBody(
      backgrounds: backgrounds,
      isSignin: isSignIn,
    );
  }
}
