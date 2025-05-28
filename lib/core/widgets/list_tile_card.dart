import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_backgrounds.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';
import 'package:student_hackerha/core/widgets/custom_circle_icon.dart';
import 'package:student_hackerha/core/widgets/list_tile_card_details.dart';
import 'package:student_hackerha/core/widgets/rounded_square_icon.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard(
      {super.key,
      required this.index,
      required this.title,
      required this.subTitle, this.backgroundIconColor, required this.iconAsset});
  final int index;
  final String title;
  final String subTitle;
 final Color? backgroundIconColor;
 final String iconAsset;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).extension<AppBackgrounds>()!;
    final contentColor = Theme.of(context).extension<AppContent>()!;
    final borderColor = Theme.of(context).extension<AppBorders>()!;
    return CustomCard(
      borderColor: borderColor.transparent,
      backgroundColor: backgroundColor.onSurfacePrimary,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 16.h(context), horizontal: 16.w(context)),
        child: Row(
          children: [
            RoundedSquareIcon(
              icon: PhosphorIcons.exam(),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  borderColor.containerOutlineStart,
                  borderColor.containerOutlineEnd,
                ],
              ),
            ),
            SizedBox(width: 8.w(context)),
            ListTileCardDetails(
              title: title,
              subTitle: subTitle,
            ),
            Spacer(),
            CustomCircleIcon(
              circleSize: 16.w(context),
              iconColor: contentColor.primaryInverted,
              backgroundColor:backgroundIconColor?? backgroundColor.primaryBrand,
              iconAsset: iconAsset,
              iconSize: 10.s(context),
            ),
          
          ],
        ),
      ),
    );
  }
}
