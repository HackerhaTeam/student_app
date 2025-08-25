// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';
import 'package:student_hackerha/features/notifications/presentation/widgets/rounded_notifications_icon.dart';

Widget getNotificationIcon(String type, BuildContext context) {
  final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
  final content = Theme.of(context).extension<AppContent>()!;
  switch (type) {
    case "alert":
      return RoundedNotificationIcon(
        icon: PhosphorIcons.xCircle(PhosphorIconsStyle.fill),
        bgColor: bgColor.negativeSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: bgColor.negativeStrong,
        size: 24.s(context),
      );
      break;
    case "new":
      return RoundedNotificationIcon(
        icon: PhosphorIcons.bellSimple(PhosphorIconsStyle.fill),
        bgColor: content.warningSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.warning,  
        size: 24.s(context),
      );
      break;
    case "success":
      return RoundedNotificationIcon(
        icon: PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
        bgColor: bgColor.successSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.success,
        size: 24.s(context),
      );
      break;
    case "discount":
      return RoundedNotificationIcon(
        icon: PhosphorIcons.sealPercent(PhosphorIconsStyle.fill),
        bgColor: bgColor.successSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.success,
        size: 24.s(context),
      );
      break;
    case "connection":
      return RoundedNotificationIcon(
        icon: PhosphorIcons.headset(PhosphorIconsStyle.fill),
        bgColor: bgColor.warningSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.warning,
        size: 24.s(context),
      );
      break;
    default:
      return RoundedNotificationIcon(
        icon: PhosphorIcons.xCircle(PhosphorIconsStyle.fill),
        bgColor: bgColor.negativeSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: bgColor.negativeStrong,
        size: 24.s(context),
      );
  }
}
