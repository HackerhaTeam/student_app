import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/set_up_server_locator.dart';
import 'package:student_hackerha/features/quiz/presentation/shared/manager/quiz_session.dart';
import 'package:student_hackerha/features/quiz/presentation/result_screen/manager/screen_shot_cubit/screen_shot_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/pages/quiz_page.dart';
import 'package:student_hackerha/main.dart';

class ActionGridViewHelper {
  static final List<IconData> icons = [
    PhosphorIcons.shareNetwork(),
    PhosphorIcons.eye(),
    PhosphorIcons.arrowCounterClockwise(),
    PhosphorIcons.houseSimple(),
    PhosphorIcons.video(),
  ];

  static final List<String> labels = [
    'مشاركة النتيجة',
    'عرض تصحيح الإجابات',
    'إعادة المحاولة',
    'الصفحة الرئيسية',
    'قائمة الدورة',
  ];

  static List<VoidCallback> actionHandlers(BuildContext context) => [
        () {
          context.read<ScreenShotCubit>().takeScreenShotAndShare(context);
        },
        () {
          // عرض تصحيح الإجابات
        },
        () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (builder) => QuizPage(),
            ),
          );
        },
        () {
          getIt.get<QuizSessionManerger>().reset();
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
