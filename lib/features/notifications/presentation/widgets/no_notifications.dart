import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/constants/assets_image.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/helpers/tags/get_theme_icon.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';
import 'package:student_hackerha/features/notifications/presentation/widgets/rounded_notifications_icon.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final bg = Theme.of(context).extension<AppBackgrounds>()!;

    return Padding(
      padding: EdgeInsets.only(top: 117.h(context)),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
                height: 306.s(context),
                width: 306.s(context),
                getThemeIcon(context, AppImages.notificationsDark,
                    AppImages.notificationsLight)),
            Text(
              "لا إشعارات في الوقت الحالي.",
              style: context.xDisplayLarge,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              textAlign: TextAlign.center,
              "لا توجد إشعارات لديك، يمكنك العودة لاحقًا للتحقق منها.",
              style: context.xParagraphLargeNormal
                  .copyWith(color: content.secondary),
            ),
            RoundedNotificationIcon(
              icon: PhosphorIcons.xCircle(PhosphorIconsStyle.fill),
              bgColor: bg.negativeSoft,
              height: 48.w(context),
              width: 48.w(context),
              iconColor: bg.negativeStrong,
              size: 24.s(context),
            )
          ],
        ),
      ),
    );
  }
}
