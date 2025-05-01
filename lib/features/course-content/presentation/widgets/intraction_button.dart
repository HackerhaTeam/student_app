import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/extentions/app_borders.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class IntractionButton extends StatelessWidget {
  const IntractionButton({
    super.key,
    required this.icon,
    this.text,
  });
  final IconData icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    final border = Theme.of(context).extension<AppBorders>()!;
    final styles = context;
    return Container(
      width: text != null ? 88.w(context) : 49,
      height: 49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          16.r(context),
        ),
        border: Border.all(color: border.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w(context)),
        child: Row(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: PhosphorIcon(
                icon,
              ),
            ),
            if (text != null)
              SizedBox(
                width: 4.w(context),
              ),
            if (text != null)
              Text(
                text!,
                style:
                    styles.xLabelMedium.copyWith(fontWeight: FontWeight.w500),
              )
          ],
        ),
      ),
    );
  }
}
