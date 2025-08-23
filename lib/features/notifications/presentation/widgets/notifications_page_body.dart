// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';
import 'package:student_hackerha/features/notifications/presentation/widgets/no_notifications.dart';
import 'package:student_hackerha/features/notifications/presentation/widgets/notifications_builder.dart';
import 'package:student_hackerha/features/notifications/presentation/widgets/notifications_header.dart';

class NotificationsPageBody extends StatelessWidget {
  const NotificationsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    bool yes = true;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w(context),
          vertical: 20.w(context),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotificationsHeader(),
              yes
                  ? Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "اليوم، تموز 25 2024",
                            style: context.xHeadingSmall
                                .copyWith(color: content.secondary),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          NotificationsCardBuilder(),
                        ],
                      ),
                    )
                  : NoNotifications()
            ],
          ),
        ),
      ),
    );
  }
}
