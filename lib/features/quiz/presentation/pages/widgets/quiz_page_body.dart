import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/quiz/presentation/pages/widgets/quiz_page_header.dart';

class QuizPageBody extends StatelessWidget {
  const QuizPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final backgrounds = Theme.of(context).extension<AppBackgrounds>()!;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 10.h(context)),
      child: Column(
        children: [
          QuizPageHeader(),
          SizedBox(height: 24.w(context)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1 / 10', style: Theme.of(context).textTheme.xLabelLarge),
              Container(
                decoration: BoxDecoration(
   color: backgrounds.onSurfaceSecondary,
   borderRadius: BorderRadius.circular(12.r(context))
                ),
                width: 86.w(context),
                height: 30.h(context),
             
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.timer(),
                        size: 16.w(context),
                      ),
                      SizedBox(
                        width: 4.w(context),
                      ),
                      Text(
                        '30:00',
                        style: Theme.of(context).textTheme.xLabelMedium,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
