import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/get_screen_width.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer_body.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer_bottom.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/quiz_drawer_header.dart';

class QuizDrawer extends StatelessWidget {
  const QuizDrawer({
    super.key,
    required this.isCorrection,
  });

  final bool isCorrection;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return SafeArea(
      child: Container(
        width: getScreenWidth(context) * 0.8,
        decoration: BoxDecoration(
          color: backgroundColor.surfacePrimary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r(context)),
              bottomLeft: Radius.circular(16.r(context))),
          border: Border(
            left: BorderSide(
              color: borderColor.transparent,
              width: 2.w(context),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 20.w(context), vertical: 30.h(context)),
          child: Column(
            children: [
              QuizDrawerHeader(),
              SizedBox(height: 24.h(context)),
              Expanded(child: QuizDrawerBody(isCorrection: isCorrection)),
              SizedBox(height: 24.h(context)),
              if (!isCorrection) QuizDrawerBottom()
            ],
          ),
        ),
      ),
    );
  }
}
