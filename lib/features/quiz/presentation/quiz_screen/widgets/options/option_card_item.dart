import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_icon.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_color.dart';

class OptionCardItem extends StatelessWidget {
  const  OptionCardItem({
    super.key,
    required this.isSelected,
    required this.optionText,
    required this.isCorrection,
    required this.optionIndex,
    required this.questionIndex,
  });
  final String optionText;
  final bool isSelected;
  final bool isCorrection;
  final int optionIndex;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Row(
        children: [
          PhosphorIcon(
            textDirection: TextDirection.ltr,
            color: getOptionColor(
                isSelected: isSelected,
                isCorrection: isCorrection,
                questionIndex: questionIndex,
                optionIndex: optionIndex,
                contentColor: contentColor),
            getOptionIcon(
                isSelected: isSelected,
                isCorrection: isCorrection,
                questionIndex: questionIndex,
                index: optionIndex),
            size: 16.w(context),
          ),
          SizedBox(width: 4.w(context)),
          Expanded(
            child: Text(
              optionText,
              style: context.xLabelLarge.copyWith(
                color: getOptionColor(
                    isSelected: isSelected,
                    isCorrection: isCorrection,
                    questionIndex: questionIndex,
                    optionIndex: optionIndex,
                    contentColor: contentColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
