import 'package:flutter/material.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/features/home/presentation/widgets/drawer/user_photo.dart';

class UserProfile extends StatelessWidget {
  final String userName;

  const UserProfile({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final background = Theme.of(context).extension<AppBackgrounds>()!;

    return Column(
      children: [
        Column(
          children: [
            UserPhoto(
              background: background,
              height: 64.h(context),
              width: 64.w(context),
            ),
          ],
        ),
        SizedBox(height: 8.h(context)),
        Text(
          userName,
          style: context.xLabelXLarge,
        ),
      ],
    );
  }
}
