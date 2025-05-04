import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/helpers/generate_questions_list.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/drawer/drawer_list_view_item.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key, required this.controller});

  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    int lastIndexAccess = context.read<PageViewCubit>().highestQuestionReached;
    int selectedIndex = context.read<PageViewCubit>().state.questionIndex;

    final Map<String, dynamic> quizData =
        getIt.get<QuizSessionManerger>().quizData!;
    final List<String> questionsList =
        generateQuestionsList((quizData['questionsList'] as List).length);

    final int questionsLength = (quizData['questionsList'] as List).length;
    return ListView.separated(
      controller: controller,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemCount: questionsLength,
      separatorBuilder: (context, index) => SizedBox(height: 16.h(context)),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (lastIndexAccess >= index && index != selectedIndex) {
              goToPage(context, index);
              closDrawer(context);
            }
          },
          child: DrawerListViewItem(
            selectedIndex: selectedIndex,
            currentIndex: index,
            questionsList: questionsList,
            lastIndexAccess: lastIndexAccess,
          ),
        );
      },
    );
  }

  void closDrawer(BuildContext context) {
    Scaffold.of(context).closeDrawer();
  }

  void goToPage(BuildContext context, int index) {
    context.read<PageViewCubit>().goToQuestion(index);
  }
}
