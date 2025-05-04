import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/utilities/enum/review_answer_type.dart';
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

    final leftItems = [
      ReviewItemData(
        text: 'عدد الأسئلة الكلي',
        number: report['totalCount'],
        color: contentColor.brandPrimary,
      ),
      ReviewItemData(
        text: 'عدد الإجابات الصحيحة',
        number: report['correctCount'],
        color: contentColor.success,
      ),
    ];

    final rightItems = [
      ReviewItemData(
        text: 'المدة المستغرقة للحل',
        number: report['timeSpend'],
        color: contentColor.brandPrimary,
        type: ReviewAnswerType.timer,
      ),
      ReviewItemData(
        text: 'عدد الإجابات الخاطئة',
        number: report['wrongCount'],
        color: contentColor.negative,
      ),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 38.w(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildColumn(leftItems),
          Spacer(),
          _buildColumn(rightItems),
        ],
      ),
    );
  }

  Column _buildColumn(List<ReviewItemData> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => ReviewAnswersCardItem(
              text: item.text,
              number: item.number,
              color: item.color,
              type: item.type ?? ReviewAnswerType.number,
            ),
          )
          .toList(),
    );
  }
}

class ReviewItemData {
  final String text;
  final dynamic number;
  final Color color;
  final ReviewAnswerType? type;

  ReviewItemData({
    required this.text,
    required this.number,
    required this.color,
    this.type,
  });
}
