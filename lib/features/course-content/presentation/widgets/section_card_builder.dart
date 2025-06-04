import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/core/widgets/list_tile_card.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/pages/quiz_page.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/main.dart';

class SectionCardBuilder extends StatelessWidget {
  const SectionCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    isBank: false,
                    isCorrection: false,
                  ),
                ),
              );
            },
            child: ListTileCard(
              iconAsset: AppImages.pdfIcon,
              index: index,
              title: "مقدمة",
              subTitle: "15:17 دقيقة",
            ),
          ),
        );
      },
    );
  }
}
