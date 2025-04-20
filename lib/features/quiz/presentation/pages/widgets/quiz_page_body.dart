import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/manager/animation_timer_cubit/animation_timer_cubit.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/custom_button_quiz_item.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/options_list_view.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_body_section.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_buttom_section.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_page_header.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_top_section.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 20.h(context)),
      child: Column(
        children: [
          QuizPageHeader(),
          SizedBox(height: 24.h(context)),
          QuizTopSection(),
          SizedBox(height: 24.h(context)),
          Expanded(child: QuizBodySection()),
          QuizButtomSection(),
          // IconButton(
          //     onPressed: () {
          //       BlocProvider.of<AnimationTimerCubit>(context).startAnimation();
          //     },
          //     icon: Icon(Icons.abc))
        ],
      ),
    );
  }
}
