import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/widgets/custom_alert_dialog.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_state.dart';
import 'package:student_hackerha/core/widgets/alert_dialog_actions.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_bottom_section.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/sections/quiz_top_section.dart';

class QuizPageViewBuilder extends StatefulWidget {
  const QuizPageViewBuilder({super.key});

  @override
  State<QuizPageViewBuilder> createState() => _QuizPageViewBuilderState();
}

class _QuizPageViewBuilderState extends State<QuizPageViewBuilder> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PageViewCubit, PageViewState>(

listener: (context, state) {
  if (state is LastQWithSkipState || state is LastQNoSkipState) {
    final bool hasSkippedQuestions = state is LastQWithSkipState;

    showDialog(
      context: context,
      builder: (_) => CustomAlertDialog(
        canPop: true,
        title: hasSkippedQuestions
            ? 'تنبيه قبل إنهاء الاختبار'
            : 'هل تود أن تُنهي الامتحان؟',
        content: hasSkippedQuestions
            ? 'تخطيت بعض الأسئلة. سيتم احتسابها كإجابات خاطئة إذا أنهيت الاختبار الآن. هل تريد المتابعة؟'
            : 'سيؤدي ذلك إلى إظهار النتائج النهائية. تأكد من مراجعة إجاباتك قبل اتخاذ هذه الخطوة!',
        actions: [
          AlertDialogActions(
          leftText: hasSkippedQuestions ? 'الإنهاء على أي حال' : 'إنهاء الاختبار',
          rightText: 'العودة للاختبار',
          leftOnPressed: () {
            // أكشن الإنهاء
          },
          rightOnPressed: () {
            Navigator.pop(context);
          },
        ),
        ]
      ),
    );
  } else {
    _pageController.animateToPage(
      state.questionIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
},



    
    
    builder: (context, state) {
      return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w(context)),
            child: Column(
              children: [
                SizedBox(height: 24.h(context)),
                QuizTopSection(questionNumber: index + 1),
                SizedBox(height: 24.h(context)),
                const Expanded(child: QuizBodySection()),
                QuizBottomSection(questionIndex: state.questionIndex, totalQuestions: state.totalQuestions,),
              ],
            ),
          );
        },
      );
    });
  }
}
