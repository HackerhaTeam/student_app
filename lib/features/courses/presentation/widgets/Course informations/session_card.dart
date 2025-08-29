import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/arabic_number_converte.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/animation/fade_widget.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/features/courses/domain/Entity/session.dart';

class SessionCard extends StatelessWidget {
  const SessionCard({super.key, required this.session, required this.sessionIndex});

final Session session;
final int sessionIndex;
  @override
  Widget build(BuildContext context) {
    var content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    return FadeInWidget(
      child: CustomCard(
        backgroundColor:  background.onSurfacePrimary,
        padding: EdgeInsets.all(16.w(context)),
        borderColor:  border.transparent,
        borderRadius: 12.w(context),
        
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                    ArabicNumberConverter.getLessonTitle(sessionIndex),
                      style:
                          context.xLabelSmall.copyWith(color: content.secondary),
                    ),
                  ),
                  const SizedBox(height: 2),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                     session.name,
                      style: context.xHeadingSmall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w(context)),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
              "${session.duration} دقيقة",
                style: context.xLabelSmall.copyWith(color: content.secondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
