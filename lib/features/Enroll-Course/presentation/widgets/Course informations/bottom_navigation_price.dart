import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/course_info_price.dart';
import 'package:student_hackerha/features/Enroll-Course/presentation/widgets/Course%20informations/floating_active_course_button.dart';

class BottomNavigationPrice extends StatelessWidget {
  const BottomNavigationPrice({
    super.key,
    required this.border,
    required this.background,
    required this.content,
  });

  final AppBorders border;
  final AppBackgrounds background;
  final AppContent content;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      borderColor: border.transparent,
      width: double.infinity,
      height: 90,
      backgroundColor: background.surfacePrimary,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedSquareIcon(
            icon: PhosphorIcons.shoppingCartSimple(),
            color: background.onSurfaceSecondary,
            gradient: LinearGradient(
                colors: [border.transparent, border.transparent]),
            iconColor: content.primary,
            size: 56,
            iconSize: 22,
          ),
          SizedBox(width: 8.w(context)),
          CourseInfoPriceView(content: content),
          SizedBox(width: 20.w(context)),
          ActiveCourseButton(width: 184.w(context)),
        ],
      ),
    );
  }
}
