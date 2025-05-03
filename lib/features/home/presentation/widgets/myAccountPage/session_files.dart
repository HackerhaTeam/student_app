// Refactored version of the AccountTabPage code

import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/features/home/presentation/widgets/myAccountPage/my_account_menu_item.dart';

class SessionFiles extends StatelessWidget {
  const SessionFiles({super.key});

  @override
  Widget build(BuildContext context) {
    final appBorders = Theme.of(context).extension<AppBorders>()!;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w(context)),
      width: double.infinity,
      padding: EdgeInsets.all(16.w(context)),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: appBorders.transparent),
          borderRadius: BorderRadius.circular(16.r(context)),
        ),
      ),
      child: Column(
        children: [
          MyAccountMenuItem(
              icon: PhosphorIcons.user(), title: "المعلومات الشخصية"),
          SizedBox(height: 12),
          MyAccountMenuItem(
              icon: PhosphorIcons.arrowsCounterClockwise(),
              title: "تغيير الكلية",
              therIsBreake: false),
        ],
      ),
    );
  }
}
