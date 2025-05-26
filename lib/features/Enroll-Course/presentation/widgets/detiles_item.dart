import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/extentions/app_content.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class DetilesItem extends StatelessWidget {
  const DetilesItem({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final PhosphorIconData icon;
  @override
  Widget build(BuildContext context) {
    final content = Theme.of(context).extension<AppContent>()!;
    final border = Theme.of(context).extension<AppBorders>()!;

    return Container(
      padding: EdgeInsets.all(16.w(context)),
      width: 182.w(context),
      decoration: BoxDecoration(
        border: Border.all(color: border.transparent),
        borderRadius: BorderRadius.circular(
          12.w(context),
        ),
      ),
      child: Wrap(
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          PhosphorIcon(
            icon,
            size: 16.w(context),
            color: content.secondary,
          ),
          SizedBox(
            width: 4.w(context),
          ),
          Text(
            title,
            style: context.xLabelSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: context.xDisplaySmall,
          ),
        ],
      ),
    );
  }
}
