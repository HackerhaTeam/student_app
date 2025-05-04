import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer_body.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer_bottom.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer_header.dart';

class QuizDrawer extends StatelessWidget {
  const QuizDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return SafeArea(
      child: Drawer(
        backgroundColor: backgroundColor.surfacePrimary,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20.w(context), vertical: 30.h(context)),
          child: Column(
            children: [
              QuizDrawerHeader(),
              SizedBox(height: 24.h(context)),
              Expanded(child: QuizDrawerBody()),
              SizedBox(height: 24.h(context)),
              QuizDrawerBottom()
            ],
          ),
        ),
      ),
    );
  }
}
