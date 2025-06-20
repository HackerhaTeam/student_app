import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/home/presentation/widgets/navbar/main_navigation.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/manager/screen_shot_cubit/screen_shot_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/pages/quiz_page.dart';

class ActionGridViewHelper {
  static List<String> iconsAssets({required bool isBank}) => [
        AppImages.shareNetwork,
        AppImages.eye,
        AppImages.arrowCounterClockwise,
        AppImages.housSimple,
        isBank ? AppImages.exam : AppImages.video,
      ];

  static List<String> labels({required bool isBank}) => [
        'مشاركة النتيجة',
        'عرض تصحيح الإجابات',
        'إعادة المحاولة',
        'الصفحة الرئيسية',
        isBank ? 'قائمة البنك' : 'قائمة الدورة',
      ];

  static List<VoidCallback> actionHandlers({required BuildContext context}) => [
        () {
          context.read<ScreenShotCubit>().takeScreenShotAndShare(context);
        },
        () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (builder) => QuizPage(
                isCorrection: true,
              ),
            ),
          );
        },
        () {
          getIt.get<QuizSessionManerger>().resetResult();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builder) => QuizPage(
                isCorrection: false,
              ),
            ),
          );
        },
        () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainNavigationPage()),
            (Route<dynamic> route) => false,
          );
        },
        () {
          Navigator.pop(context);
        },
      ];
}
