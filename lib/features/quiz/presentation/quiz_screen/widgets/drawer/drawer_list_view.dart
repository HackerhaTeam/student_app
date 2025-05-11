import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/drawer_handlers/on_drawer_item_tap.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/drawer/generate_questions_list.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/drawer_list_view_item.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
    required this.controller,
    required this.isCorrection,
  });

  final bool isCorrection;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final pageViewCubit = context.read<PageViewCubit>();

    final int lastIndexAccess = pageViewCubit.highestQuestionReached;
    final int selectedIndex = pageViewCubit.state.questionIndex;

    final quizSession = getIt.get<QuizSessionManerger>();
    final List<dynamic> rawQuestions = quizSession.quizData!['questionsList'];
    final int questionsLength = rawQuestions.length;
    final List<String> questionsList = generateQuestionsList(questionsLength);

    return ListView.separated(
      controller: controller,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemCount: questionsLength,
      separatorBuilder: (context, index) => SizedBox(height: 16.h(context)),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onDrawerItemTap(
            lastIndexAccess: lastIndexAccess,
            index: index,
            selectedIndex: selectedIndex,
            context: context,
            isCorrection: isCorrection,
          ),
          child: DrawerListViewItem(
            selectedIndex: selectedIndex,
            currentIndex: index,
            lastIndexAccess: lastIndexAccess,
            isCorrection: isCorrection,
            questionTitles: questionsList,
          ),
        );
      },
    );
  }
}
