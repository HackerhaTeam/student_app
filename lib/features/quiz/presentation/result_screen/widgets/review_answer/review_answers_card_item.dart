
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/utilities/enum/review_answer_type.dart';

class ReviewAnswersCardItem extends StatelessWidget {
  const ReviewAnswersCardItem(
      {super.key,
      required this.color,
      required this.text,
      required this.number,
       this.type =ReviewAnswerType.number});
  final Color color;
  final String text;
  final int number;
  final ReviewAnswerType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PhosphorIcon(
                PhosphorIcons.circle(PhosphorIconsStyle.fill),
                size: 8.s(context),
                color: color,
              ),
              SizedBox(width: 8.w(context)),
              TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: number),
                duration: const Duration(milliseconds: 2000),
                builder: (context, value, child) {
                  return Text( 
                    _getFormattedText(value, type),
                    style: context.xDisplaySmall.copyWith(
                      color: color,
                    ),
                  );
                },
              )
            ],
          ),
          Text(text, style: context.xLabelSmall)
        ],
      ),
    );
  }

  String _getFormattedText(int value, ReviewAnswerType type) {
    if (ReviewAnswerType.timer == type) {
      final hours = (value ~/ 3600).toString().padLeft(2, '0');
      final minutes = ((value % 3600) ~/ 60).toString().padLeft(2, '0');
      final seconds = (value % 60).toString().padLeft(2, '0');

      return "$hours:$minutes:$seconds";
    } else {
      final number = value.toString().padLeft(2, '0');
      return number;
    }
  }
}
