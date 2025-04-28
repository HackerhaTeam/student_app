import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.phosphorIcondata,
    required this.title,
    required this.color,
  });

  final PhosphorIconData phosphorIcondata;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h(context)),
      child: SizedBox(
        height: 40.h(context),
        child: Row(
          children: [
            title == "إصدار التطبيق 1.0.0"
                ? RotationTransition(
                    turns: AlwaysStoppedAnimation(90 / 360),
                    child: PhosphorIcon(
                      phosphorIcondata,
                      color: color,
                    ),
                  )
                : PhosphorIcon(
                    phosphorIcondata,
                    color: color,
                  ),
            SizedBox(
              width: 8.w(context),
            ),
            Text(
              title,
              style: context.xLabelLarge.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
