// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';

Widget getNotificationIcon(String type, BuildContext context) {
  final bgColor = Theme.of(context).extension<AppBackgrounds>()!;
  final content = Theme.of(context).extension<AppContent>()!;
  switch (type) {
    case "alert":
      return RoundedSquareIcon(
        icon: PhosphorIcons.xCircle(PhosphorIconsStyle.fill),
        bgColor: bgColor.negativeSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: bgColor.negativeStrong,
        size: 24.s(context),
      );
      break;
    case "new":
      return RoundedSquareIcon(
        icon: PhosphorIcons.bellSimple(PhosphorIconsStyle.fill),
        bgColor: content.warningSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.warning,
        size: 24.s(context),
      );
      break;
    case "success":
      return RoundedSquareIcon(
        icon: PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
        bgColor: bgColor.successSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.success,
        size: 24.s(context),
      );
      break;
    case "discount":
      return RoundedSquareIcon(
        icon: PhosphorIcons.sealPercent(PhosphorIconsStyle.fill),
        bgColor: bgColor.successSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.success,
        size: 24.s(context),
      );
      break;
    case "connection":
      return RoundedSquareIcon(
        icon: PhosphorIcons.headset(PhosphorIconsStyle.fill),
        bgColor: bgColor.warningSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: content.warning,
        size: 24.s(context),
      );
      break;
    default:
      return RoundedSquareIcon(
        icon: PhosphorIcons.xCircle(PhosphorIconsStyle.fill),
        bgColor: bgColor.negativeSoft,
        height: 48.w(context),
        width: 48.w(context),
        iconColor: bgColor.negativeStrong,
        size: 24.s(context),
      );
  }
}
