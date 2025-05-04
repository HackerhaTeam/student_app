import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/review_answer/review_answers_card.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/review_answer/review_answers_title.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/section/socre_summary_section.dart';

class ResultPageBodySection extends StatelessWidget {
  const ResultPageBodySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> report = getIt.get<QuizSessionManerger>().result!;
    return Column(
      children: [
        ScoreSummarySection(percentage: report['percentage']),
        SizedBox(height: 24.h(context)),
        ReviewTitle(),
        SizedBox(height: 16.h(context)),
        ReviewAnswersCard(report: report)
      ],
    );
  }
}
