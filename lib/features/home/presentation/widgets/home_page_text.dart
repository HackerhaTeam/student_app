import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';

class HomePageText extends StatelessWidget {
  const HomePageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        SvgPicture.asset(
          getThemeIcon(
              context, AppImages.homeTextDark, AppImages.homeTextLight),
          width: 372.w(context),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
