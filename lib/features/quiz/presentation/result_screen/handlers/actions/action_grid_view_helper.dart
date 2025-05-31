import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/manager/screen_shot_cubit/screen_shot_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/pages/quiz_page.dart';
import 'package:student_hackerha/main.dart';

class ActionGridViewHelper {
  static  List<String> iconsAssets({required bool isBank}) => [
   'assets/images/icons/share-network.svg',
    'assets/images/icons/eye.svg',
    'assets/images/icons/arrow-counter-clockwise.svg',
    'assets/images/icons/house-simple.svg',
  isBank?'assets/images/icons/exam.svg' : 'assets/images/icons/video.svg',
  ];

  static List<String> labels({required bool isBank}) => [
        'مشاركة النتيجة',
        'عرض تصحيح الإجابات',
        'إعادة المحاولة',
        'الصفحة الرئيسية',
        isBank ? 'قائمة البنك' : 'قائمة الدورة',
      ];

  static List<VoidCallback> actionHandlers(BuildContext context) => [
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
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builder) => HomePage(),
            ),
          );
        },
        () {
          // قائمة الدورة
        },
      ];
}
