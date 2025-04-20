import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/widgets/custom_icon_button.dart';
import 'package:student_hackerha/features/home/presentation/widgets/notification_icon.dart';

class HomeHeader extends StatelessWidget {
  final AppBackgrounds? backgrounds;

  const HomeHeader({
    super.key,
    required this.backgrounds,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 25.h(context), right: 20.w(context), left: 20.w(context)),
      child: Row(
        children: [
          NotificationIcon(backgrounds: backgrounds),
          const Spacer(),
          Text(
            'الرئيسية',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Spacer(),
          Builder(builder: (context) {
            return CustomIconButton(
              iconDataPhosphor: PhosphorIcons.list(),
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              hight: 44.h(context),
              width: 44.w(context),
            );
          })
        ],
      ),
    );
  }
}
