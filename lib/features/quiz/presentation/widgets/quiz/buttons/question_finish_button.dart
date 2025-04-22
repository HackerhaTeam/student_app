import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/question_finish_button_item.dart';

class QuestionFinishButton extends StatelessWidget {
  const QuestionFinishButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;

    return CustomButton(
      borderRadius: 24.r(context),
      height: 56.h(context),
      width: double.infinity,
      color: backgroundColor.primaryBrand,
      onPressed: () {
        bool isThereSkippedQuestions =
            context.read<OptionCubit>().isThereSkippedQuestions();
        context.read<PageViewCubit>().nextPage(10, isThereSkippedQuestions);
      },
      child: QuestionFinishButtonItem(),
    );
  }
}
