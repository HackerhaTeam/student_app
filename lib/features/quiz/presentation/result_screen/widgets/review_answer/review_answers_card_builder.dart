import 'package:flutter/widgets.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/widgets/review_answer/review_answers_card_content.dart';

class ReviewAnswersCardBuilder extends StatefulWidget {
  const ReviewAnswersCardBuilder(
      {super.key,
      required this.backgroundColor,
      required this.borderColor,
      required this.report});

  final AppBackgrounds backgroundColor;
  final AppBorders borderColor;
  final Map<String, dynamic> report;

  @override
  State<ReviewAnswersCardBuilder> createState() =>
      _ReviewAnswersCardBuilderState();
}

class _ReviewAnswersCardBuilderState extends State<ReviewAnswersCardBuilder> {
  Future<bool> _delayVisibility() async {
    await Future.delayed(Duration(milliseconds: 3500));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _delayVisibility(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          return CustomCard(
            backgroundColor: widget.backgroundColor.onSurfacePrimary,
            width: double.infinity,
            borderColor: widget.borderColor.transparent,
            child: Center(
              child: ReviewAnswersCardContent(report: widget.report),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
