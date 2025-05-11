import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';

class FillingLinearProgress extends StatelessWidget {
  const FillingLinearProgress({
    super.key,
    required this.maxWidth,
  });
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    final currentIndex = context.read<PageViewCubit>().state.questionIndex + 1;

    final Map<String, dynamic> quizData =
        getIt.get<QuizSessionManerger>().quizData!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: contentColor.brandPrimary,
          borderRadius: BorderRadius.circular(40.r(context))),
      height: 8.h(context),
      width: (currentIndex / (quizData['questionsList'] as List).length) *
          maxWidth,
    );
  }
}
