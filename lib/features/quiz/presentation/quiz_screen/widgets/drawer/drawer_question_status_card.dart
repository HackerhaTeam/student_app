
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/manager/option_cubit.dart/option_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/widgets/cards/custom_cards.dart';

class DrawerQuestionStatusCard extends StatelessWidget {
  const DrawerQuestionStatusCard(
      {super.key, required this.currentIndex, required this.lastIndexAccess});
  final int currentIndex;
  final int lastIndexAccess;
  @override
  Widget build(BuildContext context) {
    final contentColor = Theme.of(context).extension<AppContent>()!;

    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final questionStatus = context.read<OptionCubit>().state[currentIndex];
    return CustomCard(
      width: 76.w(context),
      height: 28.h(context),
      backgroundColor:
          _getStatusBackgroundColor(backgroundColor, questionStatus),
      child: Center(
        child: Text(
          _getStatusText(questionStatus),
          style: context.xLabelSmall.copyWith(
            color: _getStatusTextColor(contentColor, questionStatus),
          ),
        ),
      ),
    );
  }

  String _getStatusText(int? questionStatus) {
    if (lastIndexAccess <= currentIndex && questionStatus == null) {
      return 'غير محلول';
    }
    if (questionStatus == null && lastIndexAccess > currentIndex) {
      return 'مؤجل';
    }
    return 'محلول';
  }

  Color _getStatusBackgroundColor(AppBackgrounds backgroudColor, int? status) {
    if (lastIndexAccess <= currentIndex && status == null) {
      return backgroudColor.negativeSoft;
    }
    if (status == null && lastIndexAccess > currentIndex) {
      return backgroudColor.warningSoft;
    }
    return backgroudColor.successSoft;
  }

  Color _getStatusTextColor(AppContent contentColor, int? status) {
    if (lastIndexAccess <= currentIndex && status == null) {
      return contentColor.negative;
    }
    if (status == null && lastIndexAccess > currentIndex) {
      return contentColor.warning;
    }
    return contentColor.success;
  }
}
