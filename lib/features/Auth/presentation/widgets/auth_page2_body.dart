import 'package:flutter/material.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class AuthPage2Body extends StatelessWidget {
  const AuthPage2Body({
    super.key,
    required this.backgrounds,
    required this.onNext,
  });

  final AppBackgrounds backgrounds;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgrounds.primaryBrand,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Page 2", style: TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onNext,
            child: const Text("التالي"),
          ),
        ],
      ),
    );
  }
}
