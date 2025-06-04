import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/list_tile_card.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/helpers/supject_quizzes/get_subject_quiz_background_color.dart';
import 'package:student_hackerha/features/bank/presentation/subject_bank_screen/helpers/supject_quizzes/get_subject_quiz_icon_asset.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/pages/quiz_page.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/main.dart';

class SubjectQuizzesListView extends StatelessWidget {
  const SubjectQuizzesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 8.h(context)),
          child: GestureDetector(
            onTap: () {
              final sessionManager = getIt.get<QuizSessionManerger>();
              sessionManager.startNewQuiz(quizData);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(
                    isCorrection: false,
                  ),
                ),
              );
            },
            child: ListTileCard(
              iconAsset: getSubjectQuizIconAsset(index: index),
              title: 'دورة 2018 كاملة',
              subTitle: '30:00 دقيقة',
              index: index,
              backgroundIconColor: getSubjectQuizBackgroundColor(
                  index: index, backgroundColor: backgroundColor),
            ),
          ),
        );
      },
    );
  }
}
