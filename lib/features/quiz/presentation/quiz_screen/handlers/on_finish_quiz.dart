import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/dialog/show_quiz_dialog.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/handlers/submit_quiz_result_and_navigate.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';

void onFinishQuiz(BuildContext context) {
  bool hasSkippedQuestions = context.read<OptionCubit>().isThereSkippedQuestions();

  final String title = hasSkippedQuestions
      ? 'تنبيه قبل إنهاء الاختبار'
      : 'هل تود أن تُنهي الامتحان؟';

  final String content = hasSkippedQuestions
      ? 'تخطيت بعض الأسئلة. سيتم احتسابها كإجابات خاطئة إذا أنهيت الاختبار الآن. هل تريد المتابعة؟'
      : 'سيؤدي ذلك إلى إظهار النتائج النهائية. تأكد من مراجعة إجاباتك قبل اتخاذ هذه الخطوة!';

  final String leftActionText = hasSkippedQuestions ? 'الإنهاء على أي حال' : 'إنهاء الاختبار';
  final String rightActionText = 'العودة للاختبار';

  showQuizDialog(
    context: context,
    title: title,
    content: content,
    leftActionText: leftActionText,
    rightActionText: rightActionText,
    onLeftPressed: () {
      submitQuizResultAndNavigate(context);
    },
    onRightPressed: () {},
  );
}