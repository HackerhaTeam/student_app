import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.backgrounds,
  });

  final AppBackgrounds? backgrounds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: backgrounds?.onSurfaceSecondary,
        ),
        CustomButton(
          iconDataPhosphor: PhosphorIcons.bellSimple(),
          onTap: () {},
          hight: 44.h(context),
          width: 44.w(context),
        ),
      ],
    );
  }
}
