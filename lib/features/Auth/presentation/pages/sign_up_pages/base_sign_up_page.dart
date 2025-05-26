import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';

class BaseSignUpPage extends StatelessWidget {
  const BaseSignUpPage({
    super.key,
    required this.child,
    this.onNext,
    this.showNextButton = true,
    this.formKey,
    this.bottomPadding = 16,
  });

  final Widget child;
  final VoidCallback? onNext;
  final bool showNextButton;
  final GlobalKey<FormState>? formKey;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgrounds.surfacePrimary,
        floatingActionButton: showNextButton && onNext != null
            ? Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (formKey != null) {
                      final isValid =
                          formKey!.currentState?.validate() ?? false;
                      if (!isValid) return;
                    }
                    onNext!();
                  },
                  label: const Text("التالي"),
                  icon: const Icon(Icons.arrow_forward),
                ),
              )
            : null,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
          child: formKey != null ? Form(key: formKey, child: child) : child,
        ),
      ),
    );
  }
}
