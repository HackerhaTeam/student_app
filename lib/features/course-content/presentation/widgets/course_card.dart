import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/course-content/presentation/pages/course_watch_page.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;
    final background = Theme.of(context).extension<AppBackgrounds>()!;
    final styles = context;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () {
          context.navigateWithSlideTransition(CourseWatchPage(
              youtubeUrl: "https://youtu.be/N2hgYTY1zCo?si=mvKXItdDm-NpZyfD"));
        },
        child: Container(
          height: 76,
          width: 372.w(context),
          decoration: BoxDecoration(
            color: background.onSurfacePrimary,
            border: Border.all(color: border.transparent),
            borderRadius: BorderRadius.circular(
              12.r(context),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w(context)),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      isDarkMode
                          ? AppImages.lessonNumDark
                          : AppImages.lessonNumLight,
                      height: 48.w(context),
                      width: 48.w(context),
                    ),
                    Text(
                      "01",
                      style: styles.xLabelSmall.copyWith(
                          color: content.primaryInverted,
                          fontSize: 16.fs(context)),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w(context)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "مقدمة",
                        style: styles.xHeadingSmall
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "15:17 دقيقة",
                        style: styles.xLabelSmall,
                      )
                    ],
                  ),
                ),
                Spacer(),
                SizedBox(
                    height: 24.w(context),
                    width: 24.w(context),
                    child: CircleAvatar(
                      backgroundColor: background.primaryBrand,
                      child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Stack(
                            children: [
                              PhosphorIcon(
                                color: background.onSurfacePrimary,
                                size: 14.w(context),
                                PhosphorIcons.play(PhosphorIconsStyle.fill),
                              ),
                            ],
                          )),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
