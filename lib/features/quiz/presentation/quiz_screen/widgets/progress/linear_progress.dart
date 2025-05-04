import 'package:flutter/material.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/progress/empty_linear_progress.dart';
import 'package:student_hackerha/features/quiz/presentation/quiz_screen/widgets/progress/filling_linear_progress.dart';

class LinearProgress extends StatelessWidget {
  const LinearProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyLinearProgress(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              FillingLinearProgress(maxWidth: constraints.maxWidth),
            ],
          );
        },
      ),
    );
  }
}
