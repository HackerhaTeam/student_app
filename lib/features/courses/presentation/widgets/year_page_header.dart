import 'package:flutter/material.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/functions/navigation.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/features/courses/presentation/pages/search_page.dart';

class YearPageHeader extends StatelessWidget {
  const YearPageHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only( 
          top: 20.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          CustomCircleIcon(
            backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.onSurfaceSecondary,
           
            iconAsset:getThemeIcon(context, AppImages.carretRightDark, AppImages.carretRightLight),
            //icon: PhosphorIcons.caretRight(), 
            onTap: () {
              Navigator.pop(context);
            }, circleSize: 44.w(context),
          ),
          SizedBox(
            width: 8.w(context),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.xHeadingLarge,
              ),
                          ],
          ),
          const Spacer(),
          CustomCircleIcon(
            backgroundColor: Theme.of(context).extension<AppBackgrounds>()!.onSurfaceSecondary,
          iconAsset:getThemeIcon(context, AppImages.magnifyingGlassDark, AppImages.magnifyingGlassLight),
          
          //  icon: PhosphorIcons.magnifyingGlass(),
            onTap: () {
              context.navigateWithSlideTransition(SearchPage());
            }, circleSize: 44.w(context),
          )
        ],
      ),
    );
  }
}
