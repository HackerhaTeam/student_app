import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_icon_asset.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_color.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_icon_backgroun_color.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_icon_border_color.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/helpers/options/get_option_icon_color.dart';

class OptionCardItem extends StatelessWidget {
  const OptionCardItem({
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
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
      child: Row(
        children: [
          CustomCircleIcon(
            iconColor: getOptionIconColor(
                contentColor: contentColor,
                isSelected: isSelected,
                backgroundColor: backgroundColor),
            circleSize: 16.s(context),
            iconSize:10.s(context),
            borderColor: getOptionIconBorderColor(
                isSelected: isSelected,
                isCorrection: isCorrection,
                questionIndex: questionIndex,
                optionIndex: optionIndex,
                borderColor: borderColor),
            backgroundColor: getOptionIconBackgroundColor(
                isCorrection: isCorrection,
                questionIndex: questionIndex,
                optionIndex: optionIndex,
                backgroundColor: backgroundColor),
            iconAsset: getOptionIconAsset(
                isSelected: isSelected,
                isCorrection: isCorrection,
                questionIndex: questionIndex,
                optionIndex: optionIndex),
          ),
          SizedBox(width: 8.w(context)),
          Expanded(
            child: Text(
              optionText,
              style: context.xLabelLarge.copyWith(
                color: getOptionTextColor(
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
