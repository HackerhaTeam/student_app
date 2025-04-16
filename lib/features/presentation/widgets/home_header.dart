import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/colors/app_colors.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_button.dart';
import 'package:student_hackerha/features/presentation/widgets/home_page_body.dart';
import 'package:student_hackerha/features/presentation/widgets/notification_icon.dart';

class HomeHeader extends StatelessWidget {
  final AppBackgrounds? backgrounds;

  const HomeHeader({super.key, required this.backgrounds});
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).extension<AppColors>();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 20.w(context), vertical: 16.h(context)),
      child: Row(
        children: [
          NotificationIcon(backgrounds: backgrounds),
          const Spacer(),
          Text(
            'الرئيسية',
            style: TextStyle(
              fontSize: 20.fs(context),
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat-Arabic',
            ),
          ),
          const Spacer(),
          CustomButton(
            iconDataPhosphor: PhosphorIcons.list(),
            onTap: () {},
            hight: 44.h(context),
            width: 44.w(context),
          )
        ],
      ),
    );
  }
}
