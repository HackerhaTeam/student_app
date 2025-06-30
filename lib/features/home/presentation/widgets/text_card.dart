import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';
import 'package:student_hackerha/core/widgets/custom_card.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
            height: 56.h(context),
            width: 372.w(context),
            borderRadius: 8.w(context),
            borderColor: Theme.of(context).extension<AppBorders>()!.secondary,
            child: Row(
              children: [
                SizedBox(
                  width: 16.w(context),
                ),
                PhosphorIcon(
                  PhosphorIcons.magnifyingGlass(),
                ),
                SizedBox(
                  width: 8.w(context),
                ),
                Text(
                  "ابحث عن اسم مادة",
                  style: context.xLabelLarge.copyWith(
      color: Theme.of(context).extension<AppContent>()!.secondary),
                )
              ],
            ),
          );
  }
}
