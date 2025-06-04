import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/utilities/enum/review_answer_type.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/review_answer/review_answers_card_column.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/review_answer/review_answers_card_item.dart';

class ReviewAnswersCardContent extends StatelessWidget {
  const ReviewAnswersCardContent({
    super.key,
    required this.report,
  });

  final Map<String, dynamic> report;

  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [
          ReviewAnswersCardColumn(
            children: [
              ReviewAnswersCardItem(
                text: 'عدد الأسئلة الكلي',
                number: report['totalCount'],
                color: contentColor.brandPrimary,
              ),
              ReviewAnswersCardItem(
                text: 'عدد الإجابات الصحيحة',
                number: report['correctCount'],
                color: contentColor.success,
              ),
            ],
          ),
          ReviewAnswersCardColumn(
            children: [
              ReviewAnswersCardItem(
                text: 'المدة المستغرقة للحل',
                number: report['timeSpend'],
                color: contentColor.brandPrimary,
                type: ReviewAnswerType.timer,
              ),
              ReviewAnswersCardItem(
                text: 'عدد الإجابات الخاطئة',
                number: report['wrongCount'],
                color: contentColor.negative,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
