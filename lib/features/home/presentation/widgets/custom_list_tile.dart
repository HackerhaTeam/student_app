import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:student_hackerha/core/functions/get_responsive_size.dart';
import 'package:student_hackerha/core/themes/typoGraphy/app_text_styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.phosphorIcondata,
    required this.title,
    required this.iconColor,
    required this.titleColor,
    this.trailing,
  });

  final PhosphorIconData phosphorIcondata;
  final String title;
  final Color iconColor;
  final Color titleColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h(context)),
      child: ListTile(
        trailing: trailing,
        minTileHeight: 44.h(context),
        titleTextStyle:
            Theme.of(context).textTheme.xLabelLarge.copyWith(color: titleColor),
        leading: PhosphorIcon(
          phosphorIcondata,
          color: iconColor,
        ),
        title: Text(title),
      ),
    );
  }
}
