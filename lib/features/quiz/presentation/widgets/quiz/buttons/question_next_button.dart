import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/manager/page_view_cubit/page_view_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/widgets/quiz/buttons/custom_next_button_item.dart';

class QuestionNextButton extends StatelessWidget {
  const QuestionNextButton({
    super.key,
    required this.isSelected,
  });
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;

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
      child: CustomNextButtonItem(
        textStyle: Theme.of(context)
            .textTheme
            .xLabelLarge
            .copyWith(color: contentColor.primaryInverted),
        text: _getText(isSelected),
        icon: _getIcon(isSelected),
      ),
    );
  }

  String _getText(bool isSelected) {
    if (isSelected) {
      return 'السؤال التالي';
    } else {
      return 'تخطي السؤال';
    }
  }

  IconData _getIcon(bool isSelected) {
    if (isSelected) {
      return PhosphorIcons.caretRight();
    } else {
      return PhosphorIcons.caretDoubleRight();
    }
  }
}
