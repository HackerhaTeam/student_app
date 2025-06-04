import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/shared/generate_review_report.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/count_down_timer_cubit/count_down_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/pages/result_page.dart';

void submitQuizResultAndNavigate({required BuildContext context,required bool isBank}) {
  
  
  final int timerSpend =
      900 - context.read<CountdownTimerCubit>().state.duration.inSeconds;
  final List<dynamic> selectedAnswers = context.read<OptionCubit>().state;

  final Map<String, dynamic> newResult = generateReviewReport(
    timeSpend: timerSpend,
    selectedAnswers: selectedAnswers,
  );

  getIt.get<QuizSessionManerger>().setResult(newResult);

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ResultPage(isBank: isBank)),
  );
}
